# TicTacToe x86 ASM

[![CI](https://github.com/Geovanni-Gonzalez/TicTacToe-x86-ASM/actions/workflows/ci.yml/badge.svg)](https://github.com/Geovanni-Gonzalez/TicTacToe-x86-ASM/actions/workflows/ci.yml)

Repositorio documental de un proyecto academico de Tic Tac Toe en ensamblador x86 para entorno EMU8086/MS-DOS.

## Estado actual

Este repositorio conserva la documentacion publica, metadatos y una captura del proyecto original. El archivo fuente `.asm` no esta presente en la estructura actual, por lo que el repositorio se mantiene como referencia historica/documental y no como build reproducible.

## Objetivo del proyecto

Practicar fundamentos de programacion de bajo nivel mediante un juego simple por turnos:

- Representacion de tablero en consola.
- Flujo de control en ensamblador.
- Entrada/salida de texto en ambiente DOS/EMU8086.
- Validacion de turnos, victoria y empate.

## Tecnologias documentadas

- x86 Assembly 16-bit
- EMU8086 / MS-DOS
- Consola ASCII
- Interrupciones DOS

## Captura

![Captura principal](screenshots/principalImage.png)

## Estructura

```txt
TicTacToe-x86-ASM/
  .github/workflows/ci.yml   Validacion documental del repositorio
  screenshots/               Capturas disponibles del proyecto
  LICENSE                    Licencia del repositorio
  project-info.json          Metadatos bilingues del proyecto
  README.md                  Documentacion principal
```

## CI

El workflow actual valida que los archivos publicos esenciales existan:

- `README.md`
- `LICENSE`
- `project-info.json`
- `screenshots/principalImage.png`

No ejecuta ensamblado ni emulacion porque no hay fuente ASM versionada.

## Como convertirlo en repositorio reproducible

Para cerrar completamente la deuda tecnica, se debe agregar:

1. Codigo fuente, por ejemplo `src/tictactoe.asm`.
2. Ensamblador objetivo documentado: EMU8086, NASM, MASM/TASM u otro.
3. Comandos de ensamblado y ejecucion.
4. Un ejemplo de partida o salida de consola.
5. CI que valide sintaxis o, como minimo, presencia de fuente y documentacion de ejecucion.

## Estado de portafolio

Proyecto academico/historico. Se conserva para mostrar interes en programacion de bajo nivel, pero no debe presentarse como proyecto ejecutable hasta recuperar o reescribir el fuente ASM.

## Autor

Geovanni Gonzalez  
Estudiante de Ingenieria en Computacion  
GitHub: [Geovanni-Gonzalez](https://github.com/Geovanni-Gonzalez)
