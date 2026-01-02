# TicTacToe-x86-ASM

![Assembly x86](https://img.shields.io/badge/Language-Assembly%20x86-red)
![Platform](https://img.shields.io/badge/Platform-EMU8086-blue)
![License](https://img.shields.io/badge/License-MIT-green)

> **Juego del Gato (Tres en línea) implementado en lenguaje ensamblador x86.**

Este proyecto es una implementación clásica del juego Tic Tac Toe (Gato) desarrollado completamente en lenguaje ensamblador para la arquitectura x86. Está diseñado para ejecutarse en el entorno **EMU8086**, demostrando el manejo de interrupciones, lógica de juego, y manipulación de memoria a bajo nivel.

---

## 📋 Características

- **Modo Multijugador Local**: Permite a dos jugadores competir por turnos en la misma consola.
- **Interfaz en Consola**: Diseño limpio y funcional utilizando caracteres ASCII.
- **Validación de Entradas**: El sistema verifica que las casillas seleccionadas sean válidas y estén libres.
- **Detección Automática**:
  - Detección de victorias (filas, columnas y diagonales).
  - Detección de empates (tablero lleno).
- **Reinicio Rápido**: Opción para jugar nuevamente sin reiniciar el programa.

## 🛠️ Tecnologías

- **Lenguaje**: Assembly x86 (Sintaxis Intel)
- **Entorno de Desarrollo**: [EMU8086](https://github.com/emu8086/emu8086)
- **Arquitectura**: 16-bit Real Mode

## 🚀 Instalación y Uso

### Requisitos Previos

Necesitarás el emulador **EMU8086** o un entorno compatible con ensamblador x86 de 16 bits (como DOSBox con MASM/TASM, aunque el código está optimizado para EMU8086).

### Pasos para ejecutar

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/Geovanni-Gonzalez/TicTacToe-x86-ASM.git
   ```

2. **Abrir el código**:
   - Inicia EMU8086.
   - Abre el archivo `.asm` principal del proyecto (usualmente `TicTac.asm` o similar). *Nota: Asegúrate de tener el código fuente en la raíz.*
3. **Ensamblar y Ejecutar**:
   - Presiona el botón **Emulate**.
   - En la ventana del emulador, presiona **Run**.

## 📂 Estructura del Proyecto

```
TicTacToe-x86-ASM/
├── docs/               # Documentación y enunciados
├── screenshots/        # Capturas de pantalla del juego
├── project-info.json   # Metadatos del proyecto
├── LICENSE             # Licencia MIT
└── README.md           # Este archivo
```

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](./LICENSE) para más detalles.

---
*Desarrollado como parte de un proyecto académico para demostrar el dominio del lenguaje ensamblador.*
