# Sequential-ALU-with-FSM-Control

## Project Overview
This repository contains a **SystemVerilog** implementation of a 4-bit Arithmetic Logic Unit (ALU) managed by a synchronous **Finite State Machine (FSM)**. The project was developed as part of my studies at **ETTI UNSTPB** to demonstrate RTL design and functional verification skills.

## Key Features
* **Operations:** Addition, Subtraction, Bitwise AND, and Logical XOR.
* **Control Unit:** A 3-state FSM (**IDLE**, **COMPUTE**, **DONE**) that ensures data integrity and synchronization.
* **Handshaking:** Uses `start` and `ready` signals for integration into larger digital systems.

## Simulation Results
Below is the functional simulation (waveform) showing the transition between states and correct arithmetic/logic results.

<img width="1553" height="279" alt="image" src="https://github.com/user-attachments/assets/74ac58e1-d35a-4200-9a7e-7a29c846612f" />
