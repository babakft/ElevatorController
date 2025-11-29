# Elevator Controller System

A microprocessor-based elevator control system designed for a 6-story building, implemented using 8086 assembly language.

## Project Overview

This project implements a complete elevator control system with emergency features using the 8086 microprocessor. The system manages elevator movement between floors, displays current floor information, and includes safety features like emergency stop functionality.

## Features

- **6-Floor Operation**: Controls elevator movement across 6 floors
- **Emergency Stop**: Dedicated emergency button that:
  - Immediately stops the elevator at current location
  - Activates emergency light/alarm
  - Holds position for several seconds
- **Floor Display**: Real-time floor indication using 7-segment display
- **Motor Control**: Precise motor control for up/down movement
- **Button Interface**: Individual floor call buttons with pull-up design

## Hardware Components

- **8086 Microprocessor**: Main controller
- **8255A PPI**: Programmable Peripheral Interface for I/O operations
- **74LS138**: 3-to-8 decoder for I/O line selection
- **74HC373**: Latch for address/data multiplexing
- **L298**: Motor driver for elevator motor control
- **7-Segment Display**: Current floor indicator
- **Push Buttons**: Floor selection and emergency stop

## Technical Details

### 8255A Configuration

- **Port A**: Configured as simple I/O
- **Port B**: Input/output configuration (Mode 0)
- **Port C**: Split into high (PC4-7) and low (PC0-3) nibbles for flexible I/O

### Port Activation States

- `00`: Activate PORT A
- `01`: Activate PORT B
- `10`: Activate PORT C
- `11`: Activate Control Pin

### Button Design

- Pull-up configuration
- Logic: `1` (not pressed) → `0` (pressed)

