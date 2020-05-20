# matlab_pulse
Matlab code for pulse-response climate sensitivity analysis

Basic climate model is prm_fast.m

Called as follows:

[pco2 t r]=prm_fast(p0,emis,c0,f_aer,sum(fcg_had(:,3:5),2))

where pco2 is CO2 concentration in ppm
t is global mean temperature
r is TOA radiative imbalance

p is the model parameter vector - where defaults are defined in defparams.m

[p0]=defparams();

emis
is an nt*1 vector of CO2 emissions in GtC/yr, where nt is number of timesteps

c0
is the initial CO2 concentration in ppm

f_aer
is an aerosol forcing vector in Wm^-2, size nt*1

f_other
is all other climate forcers in Wm^-2, size nt*1

Code to reproduce papers:

Relating Climate Sensitivity Indices to projection uncertainty
https://www.earth-syst-dynam-discuss.net/esd-2019-77/
Reproduce with revised_clsens.m

Constraints on long term warming in a climate mitigation scenario
https://www.earth-syst-dynam-discuss.net/esd-2019-82/
Reproduce with revised.m
