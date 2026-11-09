#!/usr/bin/env python3
"""Build the preserved Core Boot R1 PID1 source and verify its installed digest."""
import argparse
import hashlib
import json
import os
import shutil
import subprocess
from pathlib import Path

GCC_SHA256 = "3918a0da3c9f2cfde359f6fed1d0df19e737438dfd2cc60edae63f2dcbf14263"
EXPECTED_PID1_SHA256 = "f9a545a1d4b6e05cd40eca7abab6395336bfe35c7b123088eeac9c2f2b0d34b7"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cross-prefix", required=True)
    parser.add_argument("--private-output", type=Path, required=True)
    parser.add_argument("--report", type=Path, required=True)
    parser.add_argument("--assembly", type=Path, required=True)
    args = parser.parse_args()
    if os.name != "posix" or "out" not in args.private_output.resolve().parts:
        parser.error("Linux and an ignored out destination are required")
    compiler = Path(args.cross_prefix + "gcc")
    if sha(compiler) != GCC_SHA256:
        parser.error("ARC compiler digest differs from the verified toolchain")
    source = Path(__file__).resolve().parents[1] / "source/pid1/init-core-r1.c"
    args.private_output.mkdir(parents=True, exist_ok=False)
    binary = args.private_output / "init"
    # ELF's STT_FILE symbol preserves the translation-unit basename.
    build_source = args.private_output / "init-core.c"
    shutil.copyfile(source, build_source)
    command = [str(compiler), "-mcpu=arc700", "-mno-lock", "-mno-atomic", "-mno-swape", "-static", "-nostdlib", "-nostartfiles", "-ffreestanding", "-fno-builtin", "-fno-stack-protector", "-fno-pic", "-Os", "-Wall", "-Wextra", "-Werror", "-Wl,-e,_start", "-Wl,--build-id=none", "-o", str(binary), str(build_source), "-lgcc"]
    completed = subprocess.run(command, capture_output=True, check=True)
    (args.private_output / "compile.stdout").write_bytes(completed.stdout)
    (args.private_output / "compile.stderr").write_bytes(completed.stderr)
    result = {"source_sha256": sha(source), "compiler_sha256": sha(compiler), "rebuilt_pid1_sha256": sha(binary), "expected_pid1_sha256": EXPECTED_PID1_SHA256, "byte_digest_equal": sha(binary) == EXPECTED_PID1_SHA256, "hardware_accessed": False, "binary_executed": False, "compilation_arguments": command[1:command.index("-o")]}
    assembly = subprocess.run([args.cross_prefix + "objdump", "-d", str(binary)], capture_output=True, check=True).stdout.decode()
    assembly = assembly.replace(str(binary), "init-core-r1.elf")
    with args.assembly.open("x", encoding="utf-8") as stream:
        stream.write(assembly)
    with args.report.open("x", encoding="utf-8") as stream:
        json.dump(result, stream, indent=2)
        stream.write("\n")
    print(f"PID1 matches installed SHA-256: {result['byte_digest_equal']}")
    if not result["byte_digest_equal"]:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
