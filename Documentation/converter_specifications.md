# Converter specifications

| Parameter | Value |
|---|---:|
| Topology | Synchronous buck |
| Input range | 10 to 14 V |
| Nominal input | 12 V |
| Output | 5 V |
| Maximum output current | 2 A |
| Maximum output power | 10 W |
| Switching frequency | 100 kHz |
| Inductor | 47 uH |
| Inductor resistance used in model | 50 mOhm |
| Output capacitor | 100 uF |
| Capacitor ESR used in model | 20 mOhm |
| Nominal load | 5 ohm |
| Full load | 2.5 ohm |
| Nominal duty cycle | 41.67% |

Calculated inductor ripple at 12 V is about 0.621 A peak-to-peak. The full-load peak current estimate is 2.31 A. For a 50 mV ripple target, the calculated minimum output capacitance is about 15.5 uF, so 100 uF was used in the model.

