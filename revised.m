if 0
[ens mdls]=read_ensembles();
read_forcing; 
pll=0;

[p0 pname plong pmin pmax]=defparams();

%test model
[pco2 t r]=prm_fast(p0,emis_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))


				%mcmc constaint
[mdlpstnl mdlpstcf mdlpst mdlpstml sd]=do_hadmcmc_rad(emis_had,fcg_had,concs_had,gm_had,f_had,fd_had,pll,sd_tas,sd_co2,sd_rad)


				%future constraint

for i=1:numel(ens)

  ttmp=ens.(mdls{i}).rcp85.tas{1};
  ytmp=ens.(mdls{1}).rcp85.year{1};
  ttt=1:find(ytmp==2020);



				%future constraint
futdat=[2020,2060,2100];
clear tomat*fut
for i=1:numel(futdat)
  ttt=1:find(tim3000==futdat(i));
[ptmp ttmp rtmp rptmp]=prm_fast(p0,emis_26(ttt)/2.12,285,fcg_26(ttt,2),sum(fcg_26(ttt,3:5),2))
[mdlpstnlfut26{i} mdlpstcffut26{i} mdlpstfut26{i} mdlpstmlfut26{i} sd ]=do_hadmcmc_rad(emis_26(ttt),fcg_26(ttt,:),ptmp,ttmp,rtmp',rptmp(:,1)',pll,sd_tas,sd_co2,sd_rad);
%mdlpstnlfut26{i}=do_hadmcmc_rad(emis_26(ttt),fcg_26(ttt,:),ptmp,ttmp,rtmp',rptmp(:,1)',pll,sd_tas,sd_co2,sd_rad);
for j=1:size(mdlpstfut26{i},2)
  tomat26nl_fut(i,j,:)=t_cfdb(pinflate(mdlpstnlfut26{i}(:,j,end),p0,sd),emis_26/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tomat26cf_fut(i,j,:)=t_cfdb(pinflate(mdlpstcffut26{i}(:,j,end),p0,sd),emis_26/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tomat26_fut(i,j,:)=t_cfdb(pinflate(mdlpstfut26{i}(:,j,end),p0,sd),emis_26/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tomat26ml_fut(i,j,:)=t_cfdb(pinflate(mdlpstmlfut26{i}(:,j,end),p0,sd),emis_26/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));

end

[ptmp ttmp rtmp rptmp]=prm_fast(p0,emis_85(ttt)/2.12,285,fcg_85(ttt,2),sum(fcg_85(ttt,3:5),2))
[mdlpstnlfut85{i} mdlpstcffut85{i} mdlpstfut85{i} mdlpstmlfut85{i} ]=do_hadmcmc_rad(emis_85(ttt),fcg_85(ttt,:),ptmp,ttmp,rtmp',rptmp(:,1)',pll,sd_tas,sd_co2,sd_rad);
%mdlpstnlfut85{i}=do_hadmcmc_rad(emis_85(ttt),fcg_85(ttt,:),ptmp,ttmp,rtmp',rptmp(:,1)',pll,sd_tas,sd_co2,sd_rad);

for j=1:size(mdlpstfut85{i},2)
  tomat85nl_fut(i,j,:)=t_cfdb(pinflate(mdlpstnlfut85{i}(:,j,end),p0,sd),emis_85/2.12,285,fcg_85(:,2),sum(fcg_85(:,3:end),2));
  tomat85cf_fut(i,j,:)=t_cfdb(pinflate(mdlpstcffut85{i}(:,j,end),p0,sd),emis_85/2.12,285,fcg_85(:,2),sum(fcg_85(:,3:end),2));
  tomat85_fut(i,j,:)=t_cfdb(pinflate(mdlpstfut85{i}(:,j,end),p0,sd),emis_85/2.12,285,fcg_85(:,2),sum(fcg_85(:,3:end),2));
  tomat85ml_fut(i,j,:)=t_cfdb(pinflate(mdlpstmlfut85{i}(:,j,end),p0,sd),emis_85/2.12,285,fcg_85(:,2),sum(fcg_85(:,3:end),2));
end
end

save('state.mat')

else
  load('state.mat')
end

if 0
 [t_ens r_ens m_lite t_arr r_arr]=calc_cmip_sens(ens,pll,sd_tas,sd_rad)

 
save('state_cmip.mat','t_ens','r_ens','m_lite','t_arr','r_arr') 
else
load('state_cmip.mat')
end

clear m_lite

 compute_ts
 calc_zem

 %% CE paper


 
 plot_ts;

% plot_emis_plaus;
 
 summary
 plot_zecbudget

plot_budget_all
 plot_temps_all
plot_emis_all
plot_plumes_all
plot_tcnst_all
plot_zecbudget_all
plot_peakneg_all



%%ECS paper
%plot_pitrnd

%plot_corr
%plot_tboxes
%plot_noise

%[tcr_act,tcr_act4,sens_act]=plot_s_tcr(ens,m_lite,mdls,r_arr,t_arr,mdlpst,mdlpstcf,mdlpstnl)
%plot_pdfs
%plot_pspread_sort
%table_noise
