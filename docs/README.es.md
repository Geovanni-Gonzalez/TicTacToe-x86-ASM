# Tic-Tac-Toe (Juego de Gato) en Ensamblador x86

[![CI](https://github.com/Geovanni-Gonzalez/TicTacToe-x86-ASM/actions/workflows/ci.yml/badge.svg)](https://github.com/Geovanni-Gonzalez/TicTacToe-x86-ASM/actions/workflows/ci.yml)
![Lenguaje](https://img.shields.io/badge/lenguaje-Ensamblador%20x86%20(16--bit)-blue)
![Plataforma](https://img.shields.io/badge/plataforma-MS--DOS%20%2F%20EMU8086-lightgrey)

**[Read in English](README.md)**

Juego de gato (tres en línea) para dos jugadores escrito completamente en **ensamblador x86 de 16 bits** para MS-DOS. Sin bibliotecas ni abstracciones del sistema operativo: el renderizado en pantalla, el control del cursor, la entrada por teclado y toda la lógica del juego están implementados directamente sobre interrupciones de BIOS (`INT 10h`) y DOS (`INT 21h`).

Desarrollado como segundo proyecto del curso *Fundamentos de Organización de Computadoras* (Ingeniería en Computación).

![Pantalla principal](screenshots/principalImage.png)

## Características

- **Interfaz interactiva en consola** — pantalla de bienvenida, tablero ASCII dibujado con posicionamiento preciso del cursor y mensajes por turno.
- **Motor de juego completo** — alternancia de turnos entre los jugadores X y O, detección de victoria en las 8 líneas ganadoras (3 filas, 3 columnas, 2 diagonales) y detección de empate.
- **Entrada robusta** — rechaza teclas fuera de `1-9` y celdas ya ocupadas, con aviso en pantalla y sin perder el turno.
- **Cierre limpio** — mensajes de fin de juego (ganador o empate) y salida correcta mediante el servicio `4Ch` de DOS.

## Cómo funciona

El tablero se almacena en nueve variables de un byte (`C1`–`C9`). Cada byte contiene el dígito ASCII de la celda (`'1'`–`'9'`) o el marcador de un jugador (`'X'` / `'O'`). Esta única representación lo resuelve todo:

- **El renderizado** imprime cada byte tal cual: las celdas libres muestran su número y las ocupadas su marcador.
- **La verificación de ocupación** es una comparación contra `'X'`/`'O'`.
- **La detección de victoria** compara la igualdad de los tres bytes de cada línea: si una línea es uniforme, solo puede tratarse de tres marcadores idénticos, ya que las celdas libres contienen dígitos distintos.

El recorrido completo del segmento de datos, el flujo de control y las decisiones de diseño está en [`docs/ARCHITECTURE.es.md`](docs/ARCHITECTURE.es.md).

## Cómo ejecutarlo

### Opción A — EMU8086 (recomendada)

1. Instalar [EMU8086](https://emu8086-microprocessor-emulator.en.softonic.com/).
2. Abrir `src/tictactoe.asm`.
3. Presionar **Emulate** y luego **Run**.

### Opción B — DOSBox + TASM/MASM

```bat
REM Turbo Assembler
tasm tictactoe.asm
tlink tictactoe.obj
tictactoe.exe

REM o Microsoft Macro Assembler
masm tictactoe.asm;
link tictactoe.obj;
tictactoe.exe
```

### Cómo se juega

Los jugadores escriben por turnos el número de una celda (`1`–`9`). El jugador 1 coloca `X` y el jugador 2 coloca `O`. El juego anuncia al ganador o el empate y finaliza.

```txt
   |   |
 1 | 2 | 3
---+---+---
   |   |
 4 | X | 6
---+---+---
   |   |
 7 | 8 | O
   |   |
```

## Estructura del proyecto

```txt
TicTacToe-x86-ASM/
├── src/
│   └── tictactoe.asm        Código fuente completo (x86 16-bit, sintaxis MASM)
├── docs/
│   ├── ARCHITECTURE.md      Documentación técnica (inglés)
│   ├── ARCHITECTURE.es.md   Documentación técnica (español)
│   └── assignment.es.md     Enunciado original del curso (español)
├── screenshots/             Capturas del juego en ejecución
├── .github/workflows/       CI: validación del repositorio y del fuente
├── project-info.json        Metadatos bilingües del proyecto
└── README.md / README.es.md
```

## Notas de desarrollo

Al preparar este repositorio para su publicación se encontró y corrigió un bug de copiar-y-pegar de la entrega original: la verificación de la fila inferior (`VERIFICAR3`) comparaba las celdas 4-5-6 en lugar de 7-8-9, por lo que una victoria en la fila inferior nunca se detectaba. Ver el historial de commits para más detalle.

## Autores

Proyecto académico desarrollado en pareja:

- **Geovanni Gonzalez Aguilar** — [@Geovanni-Gonzalez](https://github.com/Geovanni-Gonzalez)
- **Jimena Mendez Morales**

## Licencia

Todos los derechos reservados — ver [LICENSE](LICENSE). El código se publica con fines de portafolio y referencia.
