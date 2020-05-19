
for i=1:numel(mdls)
  mdls{i}
  if isfield(ens.(mdls{i}),'rcp85')
    tim_tmp=ens.(mdls{i}).rcp85.year{1};
    tt=find(tim_tmp==1870):find(tim_tmp==2020);
   tt1=find(tim21==1870):find(tim21==2020);

  emis_tmp=emis_85(tt1);
  fcg_tmp=fcg_85(tt1,:);
  concs_tmp=concs_85(tt1);
  gm_tmp=ens.(mdls{i}).rcp85.tas{1}(tt)-mean(ens.(mdls{i}).rcp85.tas{1}(1:30));
  f_tmp=gm_tmp*NaN;
  fd_tmp=fd_had*NaN;
  [mdlpst_cmip{i}]=do_hadmcmc_radconc(emis_tmp,fcg_tmp,concs_tmp,gm_tmp,f_tmp,fd_tmp,pll,sd_tas,sd_co2,sd_rad);
  
for j=1:size(mdlpst_cmip{i},2)%
  tomat85_cmip(j,:,i)=single(t_conc(pinflate(mdlpst_cmip{i}(:,j,end),p0,sd),concs_85,285,fcg_85(:,2),sum(fcg_85(:,3:end),2)));
  tomat26_cmip(j,:,i)=single(t_conc(pinflate(mdlpst_cmip{i}(:,j,end),p0,sd),concs_26,285,fcg_26(:,2),sum(fcg_26(:,3:end),2)));
end
  true85_cmip{i}=ens.(mdls{i}).rcp85.tas{1}-mean(ens.(mdls{i}).rcp85.tas{1}(1:30));
  true85_cmipyr{i}=ens.(mdls{i}).rcp85.year{1};
    if isfield(ens.(mdls{i}),'rcp26')

  true26_cmip{i}=ens.(mdls{i}).rcp26.tas{1}-mean(ens.(mdls{i}).rcp26.tas{1}(1:30));
  true26_cmipyr{i}=ens.(mdls{i}).rcp26.year{1};
    else
      true26_cmip{i}=NaN;
      true26_cmipyr{i}=NaN;
    end
  else
    mdlpst_cmip{i}=NaN;
    true85_cmip{i}=NaN;
    true85_cmipyr{i}=NaN;
    true26_cmip{i}=NaN;
    true26_cmipyr{i}=NaN;
  end
  
  end

