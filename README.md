# Synchronous FIFO Core: Design and Verilog Verification

This repository contains a fully parameterized Synchronous FIFO (First-In, First-Out) memory core design and its corresponding verification environment. The testbench uses modular behavioral tasks to thoroughly evaluate sequential write and read operations, pointer wrap-around tracking, and status indicator flags under normal and boundary operating conditions.

---

## 🛠️ Hardware Design Architecture

The hardware core (`fifo.v`) implements a synchronous circular queue architecture configured with a dedicated tracking mechanism for pointers and status flags.

### Key Features:
* **Parametric Configurations:** Completely flexible data width (`w`) and depth (`d`) attributes with automated internal pointer bit sizing utilizing `$clog2(d)`[cite: 11].
* **Status Boundary Flags:** Features robust hardware status logic for full capacity (`full`) and zero data state (`empty`) scenarios[cite: 11].
* **Exceptional Exception Flags:** Real-time generation of `overflow` indicators (when write operations are requested while full) and `underflow` indicators (when read operations are requested while empty)[cite: 11].
* **Wrap-Around Logic:** Implements pointer tracking flags (`wt_flag`, `rd_flag`) to accurately distinguish between full and empty states when write and read pointers meet at identical address locations[cite: 11].
* **Synchronous Active-High Reset:** flushes out internal pointer references, state flags, and memory slots on the rising edge of the clock[cite: 11].

---

## 🚀 Repository Directory Structure

```text
├── fifo.v                 # Synchronous FIFO Core RTL Design
├── fifo_tb.v              # Task-Based Verilog Testbench 
├── wave.do                # Modelsim/Questa Waveform Configuration Script
├── run.do                 # Automation Simulation Launch Script
└── README.md              # Documentation Front-Page