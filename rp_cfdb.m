function rd=rp_cfdb(p,emis,c0,f_aer,f_other)

[pco2 t r rp]=prm_fast(p,emis,c0,f_aer,f_other);

rd=rp(:,1);