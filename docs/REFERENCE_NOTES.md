# Preserved component notes

Editorial copy of the previous README. Workstation paths are normalized; original source and immutable evidence are not modified. Earlier status claims belong to their named checkpoints, not the live device. Start with the current [README](../README.md).

# Latest Firmware Reverse Engineer

Entrega legible del firmware instalado Core Boot R1 del HGW-500BNA-QCv2 A2, revisada el 3 de noviembre de 2026. Incluye el PID1 C realmente instalado, su desensamblado ARC, fuentes de plataforma y servicios, inventario del initramfs y análisis RAS/REA. La recompilación del PID1 reproduce el SHA-256 instalado.

La imagen tiene 5.583.159 bytes y SHA-256 `0bf0515a9be9a1be4641914477522877c1e59c4c4f9f887f699a065081692968`. El producto es `lyoko-linux73-core-boot-r1` y el kernel es `7.3.0-openmitrastar-radio73-v1`. La imagen específica de la unidad está en `../HGW500/firmware/releases/core-boot-r1/firmware.ras.bin`.

| Componente | Archivo o carpeta | Verificación |
| --- | --- | --- |
| PID1 instalado | `source/pid1/init-core-r1.c` | C preservado del contexto Core Boot R1 |
| PID1 recompilado | `analysis/pid1-rebuild.json` | SHA-256 idéntico a la imagen instalada |
| Desensamblado ARC | `analysis/pid1.arc.s` | GNU objdump del binario recompilado |
| Kernel/plataforma | `source/kernel-overlay/`, `source/core-overrides/`, `source/kernel-r2-overlay/` | Fuentes seleccionadas con hashes y procedencia |
| Arranque y red | `source/userland/` | Scripts actuales de system/network |
| RAS e initramfs | `analysis/ras-structure.json` | CRC correctos, LZMA e inventario newc saneado |
| REA | `analysis/rea-*.json` | Inspección, entropía y extracción reales |
| Aceptación instalada | `analysis/core-boot-r1-acceptance.json` | Manifiesto físico conservado |

El cuerpo RAS comprimido empieza a 8.192 y termina a 5.583.159. LZMA usa un diccionario de 8 MiB y expande 13.844.384 bytes. La cabecera declara load `0x8493a000` y entry `0x852a6000`. El initramfs newc está dentro del payload expandido y se inventaría sin copiar sus archivos privados.

El PID1 procede de `${BUILD_ROOT}/core-r1-product-r3/init-core.c` y su binario recompilado tiene SHA-256 `f9a545a1d4b6e05cd40eca7abab6395336bfe35c7b123088eeac9c2f2b0d34b7`, coincidente con la entrega instalada. El verificador conserva el nombre de compilación `init-core.c` porque el símbolo ELF STT_FILE lo incorpora. La fuente almacenada puede tener un nombre descriptivo dentro del repositorio.

La fuente del PID1 y su desensamblado permiten recorrer señales, cierre de procesos, preparación de almacenamiento, reset Topaz, carga de módulos, bridge, DHCP y servicios. Los overlays del kernel conservan su procedencia en el manifiesto de fuentes. El ensamblado integral del firmware sigue usando rootfs, DT y provisión de identidad privados y el contexto Linux 7.3 fijado. Los drivers actualizados se mantienen en sus repositorios propios en la raíz de OpenMitraStar.

`analysis/core-boot-r1-acceptance.json` conserva las pruebas de la imagen instalada, incluidos boot RAM, reinicio, arranque en frío, recuperación y Wi-Fi de 2,4 GHz con Internet. La integración física de 5 GHz, los ajustes persistentes, el selector AP/Videobridge y la campaña prolongada siguen pendientes en ese manifiesto.

REA 6.8.0 ejecutó inspección, entropía y extracción con Unblob 26.6.4. La extracción tiene cobertura parcial. El análisis nativo de REA rechaza el contenedor RAS. Las evidencias completas y los cuerpos extraídos permanecen en ext4 local. Los JSON publicados contienen metadatos saneados y hashes verificables de dichas evidencias.

Para comprobar las fuentes se ejecuta `python tools/verify_repository.py`.

La reproducción exacta del PID1 se ejecuta en Linux con el compilador ARC ya instalado y destinos nuevos.

```powershell
wsl -d Engineering -u root --exec python3 ${WORKSPACE}/hgw500-latest-firmware-reverse-engineer/tools/verify_pid1.py --cross-prefix ${BUILD_ROOT}/arc-toolchain/bin/arc-snps-linux-uclibc- --private-output ${BUILD_ROOT}/out/pid1-new --report ${WORKSPACE}/hgw500-latest-firmware-reverse-engineer/out/pid1-new.json --assembly ${WORKSPACE}/hgw500-latest-firmware-reverse-engineer/out/pid1-new.arc.s
```

El verificador fija el SHA-256 del compilador, compila el código C y comprueba el hash del PID1. Conserva el binario local y genera ensamblador legible. `tools/inspect_ras.py` reproduce la estructura del contenedor. `tools/run_rea.py` y `tools/export_rea_metadata.py` reproducen las evidencias y su proyección saneada.

Los cuerpos por unidad, las claves, los certificados, la calibración, el DT y los rootfs completos permanecen locales e ignorados. Las fuentes GPL conservan sus avisos y el texto de licencia en `COPYING.GPL-2.0`. El remoto debe conservar visibilidad privada.

## Arquitectura de procesamiento del HGW500

El [esquema y sus evidencias](../docs/HARDWARE_ARCHITECTURE.md), conservados el
3 de noviembre de 2026, identifican una CPU LHost ARC750 a 500 MHz y cuatro
coprocesadores: MuC, AuC, DSP y la MCU 8051 del RTL8192EE. Incluyen el inventario
SPI NOR de 16 MiB y el perfil DDR3 OEM de 128 MiB, con fuentes y límites.

![Arquitectura de procesamiento del HGW500](../docs/hardware/hgw500-processing-architecture.png)

El diagrama es una vista conceptual. La etiqueta qdrv describe el papel del
host; la integración física de 5 GHz en Core Boot R1 sigue pendiente.
