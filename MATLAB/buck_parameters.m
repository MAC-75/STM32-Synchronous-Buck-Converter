% values used by the average and switching models

clear
clc
close all

% ratings
vin = 12;
vin_lo = 10;
vin_hi = 14;
vo = 5;
io = 1;
io_max = 2;

fs = 100e3;
tsw = 1/fs;

% power stage
L = 47e-6;
rL = 50e-3;
C = 100e-6;
esr = 20e-3;
Cin = 100e-6;

% duty and load
d = vo/vin;
d10 = vo/vin_lo;
d14 = vo/vin_hi;

rload = vo/io;
r_full = vo/io_max;
pmax = vo*io_max;

% ripple estimates
di = ((vin-vo)*d)/(L*fs);
di10 = ((vin_lo-vo)*d10)/(L*fs);
di14 = ((vin_hi-vo)*d14)/(L*fs);

i_pk = io_max + di/2;
i_min = io_max - di/2;

dv_c = di/(8*fs*C);
dv_esr = di*esr;
dv = dv_c + dv_esr;

dv_goal = 50e-3;
Cmin = di/(8*fs*dv_goal);

% simulation
tstop = 20e-3;
tstop_cl = 50e-3;
ts_ctrl = tsw;
dt = tsw/100;

fprintf('\nSYNCHRONOUS BUCK DESIGN\n')
fprintf('Vin: %.0f to %.0f V, nominal %.0f V\n',vin_lo,vin_hi,vin)
fprintf('Vout: %.1f V\n',vo)
fprintf('Max current: %.1f A\n',io_max)
fprintf('Max power: %.1f W\n',pmax)
fprintf('Switching frequency: %.0f kHz\n',fs/1e3)

fprintf('\nDuty cycle\n')
fprintf('10 V: %.2f %%\n',d10*100)
fprintf('12 V: %.2f %%\n',d*100)
fprintf('14 V: %.2f %%\n',d14*100)

fprintf('\nInductor\n')
fprintf('L: %.0f uH\n',L*1e6)
fprintf('Ripple at 12 V: %.3f A p-p\n',di)
fprintf('Ripple at 10 V: %.3f A p-p\n',di10)
fprintf('Ripple at 14 V: %.3f A p-p\n',di14)
fprintf('Peak current: %.3f A\n',i_pk)

fprintf('\nCapacitor\n')
fprintf('Cout: %.0f uF\n',C*1e6)
fprintf('Minimum C: %.1f uF\n',Cmin*1e6)
fprintf('Estimated ripple: %.2f mV p-p\n',dv*1e3)

