function [p pname plong pmin pmax]=defparams()

p=[0.261,...% 1
   0.147,... % 2
   0.22,...% 3
  1e6,... % 4
  200, ... % 5
  40 , ... % 6
  1,... % 7
  0.33,... % 8
  0.41,... % 9
  239,...% 10
   30,...% 11
  .33,...% 12
  1];% 13

pmin=[0.1,... %1
   0.1,... %2
   0.1,...%3
  1e6,...%4
  100,...%5
  20,...%6
  1,...%7
  0.,...%8
  0.,...%9
  80,...%10
  1,...%11
  .0,...%12
  0];%13

pmax=[.3,... %1
   .3,... %2
   .3,...%3
  1e6,...%4
  500,...%5
  50,...%6
  10,...%7
  20,...%8
  1.5,...%9
  3000,... %10
   40,... %11
  1,... %12
     2]; %13

pname={'a_0',...%1
       'a_1',...%2
       'a_2',...%3
       't_0',...%4
       't_1',...%5
       't_2',...%6
       't_3',...%7
       'q_1',...%8
       'q_2',...%9
       'd_1',...%10
       'd_2',...%11
       'r_1',...%12
       'f_r'};%13
   
plong={'Geological re-absorption fraction',...%1
       'Deep ocean invasion/equilibration fraction',...%2
       'Biospheric uptake/ocean thermocline invasion fraction',...%3
       'Geological re-absorption timescale',...%4
       'Deep ocean invasion/equilibration timescale',...%5
       'Biospheric uptake/ocean thermocline invasion timescale',...%6
       'Rapid biospheric uptake/ocean mixed-layer invasion timescale',...%7
       'Thermal equilibration of deep ocean Sensitivity',...%8
       'Thermal adjustment of upper ocean Sensitivity',...%9
         'Thermal equilibration of deep ocean timescale',...%10
       'Thermal adjustment of upper ocean timescale',...%11
       'Fraction of forcing absorbed by deep ocean',...%12
       'Non-CO2 Forcing ratio'};%13
