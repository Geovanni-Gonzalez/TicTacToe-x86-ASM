# TECHNICAL_REVIEW — TicTacToe-x86-ASM

Fecha de revisión: 2026-07-16
Método: análisis estático, enunciado (`docs/Enunciado_TicTacToe.md`), CI y git. No ejecutable en el sandbox (requiere EMU8086/DOSBox); el CI solo valida presencia de archivos (no ensambla).

## 1. Comprensión del proyecto

Tic-Tac-Toe de 2 jugadores en **ensamblador x86 de 16 bits para MS-DOS** (892 líneas, un solo módulo): render, cursor, teclado y lógica directamente sobre interrupciones BIOS (`INT 10h`) y DOS (`INT 21h`). Documentación ya excelente: README bilingüe + `ARCHITECTURE.md` con walkthrough del segmento de datos y decisiones de diseño.

## 2. Cumplimiento y calidad

🟦 Todo verificado por lectura: tablero como 9 bytes (`C1`-`C9`) con representación dual dígito/marcador — decisión elegante que unifica render, chequeo de ocupación y detección de victoria (línea uniforme ⇒ 3 marcadores iguales, porque las celdas libres tienen dígitos distintos); validación de entrada robusta; salida limpia vía `4Ch`.

## 3. Fortalezas

1. La representación de datos del tablero es el tipo de decisión que un entrevistador de bajo nivel aprecia — y está **explicada por escrito** en ARCHITECTURE.md.
2. Tercera ISA del portafolio (x86-16 real mode, además de ARM y MIPS generado) — completa el bloque de arquitectura.
3. Presentación ya al estándar: badges, bilingüe, arquitectura documentada.

## 4. Debilidades y riesgos

| Hallazgo | Severidad | Nota |
|---|---|---|
| CI solo verifica existencia de archivos (no ensambla) | Baja-Media | JWasm/NASM-compatible o DOSBox headless podrían ensamblarlo; aun un `nasm -f bin` de humo suma |
| ~~Links rotos: `README.es.md` (está en docs/) e imagen `screenshots/`~~ | — | Corregido en esta pasada |
| Monolito de 892 líneas | Baja | Aceptable para DOS de un archivo; ARCHITECTURE.md lo compensa |

## 5. Evaluación profesional

- Nivel demostrado: **Junior+ en bajo nivel**, con presentación Mid. El valor está en la explicación de diseño más que en el alcance.
- Rol en el portafolio: completa la tríada de ISAs (x86/ARM/MIPS); citarlo como bloque junto a BattleshipARM y RISCMatrixApp, no individualmente.

## 6. Recomendaciones

Ver `IMPROVEMENT_ROADMAP.md`. P1: hacer que el CI ensamble.
