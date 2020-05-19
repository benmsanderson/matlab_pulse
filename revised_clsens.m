if 0
[ens mdls]=read_ensembles();
read_forcing; 
pll=0;

[p0 pname plong pmin pmax]=defparams();


				%mcmc constaint
[mdlpstnl mdlpstcf mdlpst mdlpstml sd]=do_hadmcmc_radconc(emis_had,fcg_had,concs_had,gm_had,f_had,fd_had,pll,sd_tas,sd_co2,sd_rad,2000000)

cmip_check
  
save('state_conc.mat')

else
  load('state_conc.mat')
end




if 0
 [t_ens r_ens m_lite t_arr r_arr]=calc_cmip_sens(ens,pll,sd_tas,sd_rad)
save('state_cmip_conc.mat','t_ens','r_ens','m_lite','t_arr','r_arr') 
else
load('state_cmip_conc.mat')
end




clear m_lite

 compute_ts_conc


 %% CE paper


 
% plot_ts;

% plot_emis_plaus;
 
% summary
% plot_zecbudget

%plot_budget_all
% plot_temps_all
%plot_emis_all
%plot_plumes_all
%plot_tcnst_all
%plot_zecbudget_all
%plot_peakneg_all



 %%ECS paper
 plot_cmip_check
plot_pitrnd

plot_corr
plot_tboxes
plot_noise

[tcr_act,tcr_act4,sens_act]=plot_s_tcr(ens,m_lite,mdls,r_arr,t_arr,mdlpst,mdlpstcf,mdlpstnl)
plot_pdfs
plot_pspread_sort
table_noise
plot_corner_sens
matchtrnd
