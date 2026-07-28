# STM32-Controlled Synchronous Buck Converter

## Target Specifications

| Parameter | Selected value |
|---|---:|
| Converter topology | Synchronous buck |
| Nominal input voltage | 12 V |
| Input-voltage range | 10–14 V |
| Output voltage | 5 V |
| Maximum output current | 2 A |
| Maximum output power | 10 W |
| Switching frequency | 100 kHz |
| Inductor | 47 µH |
| Output capacitor | 100 µF |
| Input capacitor | 100 µF |
| Nominal load resistance | 5 Ω |
| Full-load resistance | 2.5 Ω |
| Nominal duty cycle | 41.67% |
| Control platform | STM32G431RB |
| Initial controller | Digital PI controller |
| Tuning method | Manual PI versus optimization-assisted PI |

## Calculated Results

- Nominal inductor-current ripple: approximately 0.621 A peak-to-peak
- Maximum calculated ripple: approximately 0.684 A peak-to-peak
- Peak full-load inductor current: approximately 2.31 A
- Minimum required output capacitance for 50 mV ripple: approximately 15.5 µF
- Selected output capacitance: 100 µF
- Controller sampling period: 10 µs