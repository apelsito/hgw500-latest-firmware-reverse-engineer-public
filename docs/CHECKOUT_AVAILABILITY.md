> Public export: availability below describes the source base. Check `PUBLICATION.json` for excluded native databases and private authoring files.

# Published checkout availability

The table below is derived from the remote base tree used for this documentation
update. It makes newer maintainer-local source selections visible without claiming
that they are already in this clone. A documentation commit does not change
firmware sources, original binaries, toolchain pins or selected submodule commits.

| Entry point | Available in remote base |
| --- | --- |
| `analysis/source-manifest.json` | Yes |
| `analysis/pid1-rebuild.json` | Yes |
| `analysis/pid1.arc.s` | Yes |
| `analysis/ras-structure.json` | Yes |
| `analysis/core-boot-r1-acceptance.json` | Yes |
| `source/pid1/` | Yes |
| `source/kernel-overlay/` | Yes |
| `source/userland/` | Yes |
| `tools/verify_pid1.py` | Yes |
| `COPYING.GPL-2.0` | Yes |

## Submodule handoffs

Source and analysis submodule revisions stay pinned. Use the direct child
repository links in [the repository map](REPOSITORY_MAP.md) to read newer handoff
documentation; a parent clone intentionally retains the selected child revision.

## Integrity manifests

Where an artifact manifest includes README/documentation bytes, this update
refreshes only those members and aggregate counts. Existing non-document source
and evidence rows remain unchanged. Historical reports are not rewritten to
pretend that new builds or physical checks were run.
