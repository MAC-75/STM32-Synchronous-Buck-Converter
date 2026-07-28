# Open-loop checks

12 V input, 100 kHz, 41.67% duty and a 5 ohm load. Expected 5 V and 1 A.

Average model: settles close to 5 V and 1 A. Startup has a damped oscillation.
![Average voltage](../Results/average_model_output_voltage.png)
![Average current](../Results/average_model_output_current.png)

Switching model: complementary high-side and low-side PWM. Average output is close to 5 V and 1 A.
![Switching voltage](../Results/switching_model_output_voltage.png)
![Switching current](../Results/switching_model_output_current.png)

Current shown is load current, measured after the converter output.
