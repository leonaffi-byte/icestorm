# iCE40 UltraLite (ul1k) test bitstreams

Bitstreams written by Lattice iCEcube2 for the iCE40UL1K, used by `run.sh` to
check `iceunpack`/`icepack` (bit-exact round trip of the configuration),
`icebox_explain` (every set bit has a database entry) and `icebox_vlog`.

| File | Part | Source | Licence |
|---|---|---|---|
| `voxlink_core_module_bringup.bin` | iCE40UL1K-CM36A, iCEcube2 2020.12 | github.com/MichalVarsanyi/VoxLink c040553, `Firmware/Lattice/Projects/Core_Module_BringUp` (PLL, RGB driver) | MIT, (c) 2025 Michal Varsanyi |
| `voxlink_protocol.bin` | iCE40UL1K-CM36A, iCEcube2 2020.12 | same repository, `Firmware/Lattice/Projects/VoxLink_Protocol` (1151 logic cells, 6 global buffers, PLL, RGB driver) | MIT, (c) 2025 Michal Varsanyi |
| `dipsydownloader_ex01.bin` | iCE40UL1K-SWG16, iCEcube2 2015.04 | github.com/crteensy/dipsydownloader 2a0f7d2, `examples/ex01_arrayConfig` (HFOSC through the fabric, RGB driver) | MIT, (c) 2015 crteensy |

The header comment of `voxlink_protocol.bin` (before the 7EAA997E preamble)
is one byte shorter than what icepack writes; the configuration is identical.
