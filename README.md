# Moon Patrol in 8086 Assembly

A simplified version of the 1982 arcade game *Moon Patrol* (Irem), written from scratch in 8086 Assembly for the Computer Architecture course at UCS (Universidade de Caxias do Sul).

> **Status:** work in progress. The graphics foundation is done; gameplay is being built step by step.

## About the project

The goal is to build a playable game directly on top of the hardware, without libraries. Everything is drawn by writing bytes into video memory, and all input and timing come from BIOS (Basic Input/Output System) and DOS (Disk Operating System) interrupts.

The player drives a lunar jeep that moves across the Moon's surface, jumping over craters and rocks and shooting at alien ships.

## Technical details

- **CPU:** Intel 8086 (16-bit, real mode)
- **Assembler:** TASM (Turbo Assembler), via GUI Turbo Assembler
- **Runtime:** DOSBox (DOS emulator)
- **Video:** mode 13h, 320×200 pixels with 256 colors, where each pixel is one byte in memory at segment `A000h`

Pixel addressing uses the formula `offset = y × 320 + x`, because video memory is a single linear block of 64,000 bytes that the video card splits into rows of 320 pixels.

## Features

### Done
- [x] Switch to graphics mode 13h and back to text mode
- [x] Compute a pixel's memory offset from (x, y) coordinates
- [x] Draw horizontal lines with loops
- [x] Draw filled rectangles with nested loops

### Planned
- [ ] Sprite drawing from bitmaps, with transparency
- [ ] Start screen with ASCII art title, animation and menu
- [ ] Scrolling lunar surface with mountains
- [ ] Jeep movement and trapezoidal jump
- [ ] Craters and rocks as obstacles
- [ ] Alien ships, projectiles and collision detection
- [ ] Status bar with score, lives and timer
- [ ] Game over screen

## Controls (planned)

| Key | Action |
|---|---|
| ← / → | Move the jeep |
| ↑ | Jump |
| Space | Fire both cannons |
| Esc | End the game |

## How to run

1. Install [GUI Turbo Assembler](https://sourceforge.net/projects/guitasm8086/).
2. Open `game.asm`.
3. Click **Assemble**, then **Run**. The program runs inside the built-in DOSBox.

## Author

Lucas Zorrer
