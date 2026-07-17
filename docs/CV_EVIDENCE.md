# CV_EVIDENCE — TicTacToe-x86-ASM

Supplementary low-level evidence. Cite as part of the assembly block (BattleshipARM + RISCMatrixApp + this), not standalone.

## Unique evidence

| Item | Evidence |
|---|---|
| Third ISA: 16-bit x86 real mode (portfolio also has ARM handwritten + MIPS generated) | `src/tictactoe.asm` (892 lines) |
| BIOS/DOS interrupt programming (`INT 10h` video/cursor, `INT 21h` I/O) | Same file |
| Data-representation design: dual-purpose board bytes (digit = free / marker = taken) unifying render, occupancy, and win detection | `docs/ARCHITECTURE.md` |

## Optional resume bullet

- Wrote a complete two-player Tic-Tac-Toe for MS-DOS in 16-bit x86 assembly using only BIOS/DOS interrupts, with a dual-purpose board representation that unifies rendering, move validation, and win detection; design documented in an architecture walkthrough.

## ATS keywords (incremental)

x86 assembly, 16-bit, real mode, BIOS interrupts, MS-DOS, EMU8086, computer organization.
