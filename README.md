# Synchronous FIFO Core: Design and Verilog Verification

This repository contains a fully parameterized Synchronous FIFO (First-In, First-Out) memory core design and its corresponding verification environment[cite: 11, 12]. The testbench uses modular behavioral tasks to thoroughly evaluate sequential write and read operations, pointer wrap-around tracking, and status indicator flags under normal and boundary operating conditions[cite: 11, 12].

---

## 🛠️ Hardware Design Architecture

The hardware core (`fifo.v`) implements a synchronous circular queue architecture configured with a dedicated tracking mechanism for pointers and status flags[cite: 11].

### Key Features:
* **Parametric Configurations:** Completely flexible data width (`w`) and depth (`d`) attributes with automated internal pointer bit sizing utilizing `$clog2(d)`[cite: 11].
* **Status Boundary Flags:** Features robust hardware status logic for full capacity (`full`) and zero data state (`empty`) scenarios[cite: 11].
* **Exceptional Exception Flags:** Real-time generation of `overflow` indicators (when write operations are requested while full) and `underflow` indicators (when read operations are requested while empty)[cite: 11].
* **Wrap-Around Logic:** Implements pointer tracking flags (`wt_flag`, `rd_flag`) to accurately distinguish between full and empty states when write and read pointers meet at identical address locations[cite: 11].
* **Synchronous Active-High Reset:** Flushes out internal pointer references, state flags, and memory slots on the rising edge of the clock[cite: 11].

---

## 🔌 Signal Port Actions & Detailed Behavior

The table below describes the function, direction, and specific behavior of every port defined in the `fifo` module (`fifo.v`)[cite: 11]:

| Port Name | Direction | Width | Description / Action Behavior |
| :--- | :--- | :--- | :--- |
| **`clk`** | Input | 1-bit | **Master Clock:** Synchronizes all internal operations. Write, read, and reset operations execute on the rising edge of this signal[cite: 11]. |
| **`rst`** | Input | 1-bit | **Synchronous Active-High Reset:** When asserted (`1`) on the positive edge of `clk`, it immediately zeroes out the pointers, output data, exception flags, and completely flushes the entire memory array to `0`[cite: 11]. |
| **`w_data`** | Input | `[w-1:0]` | **Write Data Bus:** Carries the incoming data byte/word to be stored into the FIFO memory array[cite: 11]. |
| **`wt_en`** | Input | 1-bit | **Write Enable:** Triggers a write transaction on the next rising clock edge. If the FIFO is not full, `w_data` is stored into the memory slot pointed to by `wt_pt`[cite: 11]. |
| **`rd_en`** | Input | 1-bit | **Read Enable:** Triggers a read transaction on the next rising clock edge. If the FIFO is not empty, data from the slot pointed to by `rd_pt` is moved to the `rdata` output[cite: 11]. |
| **`full`** | Output | 1-bit | **FIFO Full Indicator:** Asserts (`1`) when the FIFO has no remaining storage space. Driven by hardware when write and read pointers match but their wrap flags differ (`wt_pt == rd_pt && wt_flag != rd_flag`)[cite: 11]. |
| **`empty`** | Output | 1-bit | **FIFO Empty Indicator:** Asserts (`1`) when the FIFO contains zero valid data words. Driven when pointers match and their wrap flags are identical (`wt_pt == rd_pt && wt_flag == rd_flag`)[cite: 11]. |
| **`rdata`** | Output | `[w-1:0]` | **Read Data Bus:** Exposes the data word fetched from the current read pointer location (`rd_pt`) inside the memory array[cite: 11]. |
| **`overflow`** | Output | 1-bit | **Write Error Exception:** Latches high (`1`) on the clock edge if a write request (`wt_en = 1`) is made while the FIFO is already `full`. De-asserts back to `0` during valid writes or when `wt_en` drops[cite: 11]. |
| **`underflow`** | Output | 1-bit | **Read Error Exception:** Latches high (`1`) on the clock edge if a read request (`rd_en = 1`) is attempted while the FIFO is completely `empty`. De-asserts back to `0` during valid reads or when `rd_en` drops[cite: 11]. |

---

## 🚀 Repository Directory Structure

```text
├── fifo.v                 # Synchronous FIFO Core RTL Design
├── fifo_tb.v              # Task-Based Verilog Testbench 
├── wave.do                # Modelsim/Questa Waveform Configuration Script
├── run.do                 # Automation Simulation Launch Script
└── README.md              # Documentation Front-Page
```text
├── fifo.v                 # Synchronous FIFO Core RTL Design
├── fifo_tb.v              # Task-Based Verilog Testbench 
├── wave.do                # Modelsim/Questa Waveform Configuration Script
├── run.do                 # Automation Simulation Launch Script
└── README.md              # Documentation Front-Page
