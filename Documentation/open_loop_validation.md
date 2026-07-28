# Open-loop model check

Test point used for both models:

| Parameter | Value |
|---|---:|
| Input voltage | 12 V |
| Switching frequency | 100 kHz |
| Duty cycle | 41.67% |
| Load | 5 ohm |
| Expected voltage | 5 V |
| Expected current | 1 A |

## Averaged model

The averaged model settles close to 5 V and 1 A. There is a damped oscillation during startup.

![Average voltage](../Results/average_model_output_voltage.png)

![Average current](../Results/average_model_output_current.png)

## PWM switching model

The PWM model uses complementary high-side and low-side gate signals. Its average output also settles close to 5 V and 1 A.

![Switching voltage](../Results/switching_model_output_voltage.png)

![Switching current](../Results/switching_model_output_current.png)

The plotted current is the load current measured after the converter output.

