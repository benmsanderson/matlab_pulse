function rd=rp_conc(p,conc,c0,f_aer,f_other)

[pco2 t r rp]=prm_conc(p,conc,c0,f_aer,f_other);

rd=rp(:,1);
