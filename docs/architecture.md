# Hand-Hygiene Compliance Timer: Architecture

## 1. Design Parameters
| Parameter | Value |
|---|---|
| Clock frequency | 32.768 kHz |
| Wash durations (mode_sel) | 00 = 20 s, 01 = 30 s, 10 = 40 s, 11 = 20 s (reserved) |
| Grace period | 2 s |
| Debounce time | ~50 ms (2^11 clocks at 32.768 kHz is about 62 ms) |
| Log counter width | 8 bits, saturating |
| 1 s tick divider | 32768 clocks (simulation: 8 clocks) |

## 2. Ports
| Signal | Dir | Width | Description |
|---|---|---|---|
| clk | in | 1 | System clock |
| rst_n | in | 1 | Active-low asynchronous reset |
| sensor_in | in | 1 | Hands/water detected (asynchronous) |
| mode_sel | in | 2 | Wash duration select |
| clear_log | in | 1 | Clears good/bad counters |
| led_progress | out | 3 | Progress in thirds of the target time |
| led_done | out | 1 | Compliant wash completed |
| buzzer | out | 1 | Beeps on done or too-short |
| alarm_short | out | 1 | Wash ended too early |
| good_cnt | out | 8 | Compliant wash count |
| bad_cnt | out | 8 | Non-compliant wash count |

## 3. Blocks
| Module | Function |
|---|---|
| synchronizer | 2-FF synchronizer for sensor_in |
| debounce | Passes the sensor value only after it is stable for the debounce time |
| tick_gen | Divides clk to a 1-cycle-wide 1 s tick enable (no derived clock) |
| wash_fsm | Main control: timing, grace period, outputs |
| sat_counter | 8-bit saturating counter with clear |
| top | Connects everything |

## 4. FSM State Table
| State | Condition | Next state | Outputs |
|---|---|---|---|
| IDLE | sensor stable high | WASHING | latch target time, clear timers |
| WASHING | seconds >= target | DONE_OK | good_cnt +1 |
| WASHING | sensor low | PAUSED | start grace timer |
| PAUSED | sensor high within grace | WASHING | resume |
| PAUSED | grace expires | DONE_SHORT | bad_cnt +1 |
| DONE_OK | beep pattern finished | COOLDOWN | led_done = 1, buzzer beeps |
| DONE_SHORT | beep pattern finished | COOLDOWN | alarm_short = 1, buzzer beeps |
| COOLDOWN | sensor low and cooldown timer expired | IDLE | all indications off |

## 5. Prescaler Numbers
- Hardware: 32768 clocks per second at 32.768 kHz
- Simulation: parameter set to 8 clocks per "second" so tests run quickly
- led_progress: seconds >= target/3 sets bit 0, >= 2*target/3 sets bit 1, >= target sets bit 2