%% STM32-Controlled Synchronous Buck Converter
% Phase 1: Converter specifications and calculations

clear;
clc;
close all;

%% 1. Converter specifications

Vin_nominal = 12;          % Nominal input voltage, V
Vin_min = 10;              % Minimum input voltage, V
Vin_max = 14;              % Maximum input voltage, V

Vout = 5;                  % Required output voltage, V
Iout_nominal = 1;          % Nominal output current, A
Iout_max = 2;              % Maximum output current, A

fsw = 100e3;               % Switching frequency, Hz
Tsw = 1/fsw;               % Switching period, s

%% 2. Selected components

L = 47e-6;                 % Inductor, H
RL = 50e-3;                % Estimated inductor resistance, ohm

Cout = 100e-6;             % Output capacitor, F
ESR_Cout = 20e-3;          % Estimated capacitor ESR, ohm

Cin = 100e-6;              % Input bulk capacitor, F

%% 3. Duty-cycle calculations

D_nominal = Vout/Vin_nominal;
D_at_Vin_min = Vout/Vin_min;
D_at_Vin_max = Vout/Vin_max;

%% 4. Load resistance calculations

Rload_nominal = Vout/Iout_nominal;
Rload_full = Vout/Iout_max;

Pout_nominal = Vout*Iout_nominal;
Pout_max = Vout*Iout_max;

%% 5. Inductor ripple calculations

Delta_IL_nominal = ...
    ((Vin_nominal - Vout)*D_nominal)/(L*fsw);

Delta_IL_Vin_min = ...
    ((Vin_min - Vout)*D_at_Vin_min)/(L*fsw);

Delta_IL_Vin_max = ...
    ((Vin_max - Vout)*D_at_Vin_max)/(L*fsw);

%% 6. Peak and minimum inductor current

IL_peak = Iout_max + Delta_IL_nominal/2;
IL_minimum = Iout_max - Delta_IL_nominal/2;

%% 7. Approximate output-voltage ripple

Delta_Vout_capacitive = ...
    Delta_IL_nominal/(8*fsw*Cout);

Delta_Vout_ESR = ...
    Delta_IL_nominal*ESR_Cout;

Delta_Vout_total = ...
    Delta_Vout_capacitive + Delta_Vout_ESR;

%% 8. Minimum capacitor calculation

Target_voltage_ripple = 50e-3;

Cout_minimum = ...
    Delta_IL_nominal/(8*fsw*Target_voltage_ripple);

%% 9. Simulation parameters

Tstop_open_loop = 20e-3;
Tstop_closed_loop = 50e-3;

Ts_control = Tsw;
Ts_simulation = Tsw/100;

%% 10. Display calculated results

fprintf('\n');
fprintf('============================================\n');
fprintf(' SYNCHRONOUS BUCK CONVERTER DESIGN SUMMARY\n');
fprintf('============================================\n');

fprintf('Input-voltage range       : %.1f V to %.1f V\n', ...
    Vin_min, Vin_max);

fprintf('Nominal input voltage     : %.1f V\n', ...
    Vin_nominal);

fprintf('Required output voltage   : %.1f V\n', ...
    Vout);

fprintf('Maximum output current    : %.1f A\n', ...
    Iout_max);

fprintf('Maximum output power      : %.1f W\n', ...
    Pout_max);

fprintf('Switching frequency       : %.0f kHz\n', ...
    fsw/1000);

fprintf('Switching period          : %.2f us\n', ...
    Tsw*1e6);

fprintf('\n--- Duty cycle ---\n');

fprintf('At 10 V input             : %.2f %%\n', ...
    D_at_Vin_min*100);

fprintf('At 12 V input             : %.2f %%\n', ...
    D_nominal*100);

fprintf('At 14 V input             : %.2f %%\n', ...
    D_at_Vin_max*100);

fprintf('\n--- Load values ---\n');

fprintf('Nominal-load resistance   : %.2f ohm\n', ...
    Rload_nominal);

fprintf('Full-load resistance      : %.2f ohm\n', ...
    Rload_full);

fprintf('\n--- Inductor results ---\n');

fprintf('Selected inductance       : %.1f uH\n', ...
    L*1e6);

fprintf('Ripple at 12 V input      : %.3f A peak-to-peak\n', ...
    Delta_IL_nominal);

fprintf('Ripple at 10 V input      : %.3f A peak-to-peak\n', ...
    Delta_IL_Vin_min);

fprintf('Ripple at 14 V input      : %.3f A peak-to-peak\n', ...
    Delta_IL_Vin_max);

fprintf('Peak inductor current     : %.3f A\n', ...
    IL_peak);

fprintf('Minimum inductor current  : %.3f A\n', ...
    IL_minimum);

fprintf('\n--- Capacitor results ---\n');

fprintf('Selected output capacitor : %.1f uF\n', ...
    Cout*1e6);

fprintf('Minimum calculated value  : %.1f uF\n', ...
    Cout_minimum*1e6);

fprintf('Estimated voltage ripple  : %.2f mV peak-to-peak\n', ...
    Delta_Vout_total*1000);

fprintf('\n--- Simulation values ---\n');

fprintf('Control sample time       : %.2f us\n', ...
    Ts_control*1e6);

fprintf('Simulation step target    : %.2f ns\n', ...
    Ts_simulation*1e9);

fprintf('============================================\n');