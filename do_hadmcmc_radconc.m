function [mdlpstnl mdlpstcf mdlpst mdlpstml sd]=do_hadmcmc_radconc(emis_had,fcg_had,concs_had,gm_had,f_had,fd_had,pll,sd_tas,sd_co2,sd_rad,n_it)

  if nargin<11
    n_it=400000;
  end
  
if pll
  parforArg = Inf;
else
  parforArg = 0;
end

%choose optimization parameters (others left at default)
sd=[1:13];
addpath('gwmcmc/')

[p0 pname plong pmin pmax]=defparams();

pd0=p0(sd);
pdmin=pmin(sd);
pdmax=pmax(sd);


pdmax_nolong=pdmax;
pdmax_nolong(8)=0;



nl=400;
lhn=lhsdesign(nl,numel(sd));

p_lds=(pdmin+repmat(pdmax-pdmin,nl,1).*lhn)';

p_lds_nolong=p_lds;
p_lds_nolong(8,:)=0;

%c_errcf=@(p) sum(((prm_fast(pinflate(p,p0,sd),emis_had/2.12,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-concs_had)).^2);
t_errcf=@(p) sum(((t_conc(pinflate(p,p0,sd),concs_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-gm_had)).^2);
r_errcf=@(p) nansum(((r_conc(pinflate(p,p0,sd),concs_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-f_had')).^2);
rd_errcf=@(p) nansum(((rp_conc(pinflate(p,p0,sd),concs_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-fd_had')).^2);

%c_err=@(p) sum(((prm_fast(pinflate(p,p0,sd),emis_had/2.12,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-concs_had)/(sqrt(2)*sd_co2)).^2);
t_err=@(p) sum(((t_conc(pinflate(p,p0,sd),concs_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-gm_had)/(sqrt(2)*sd_tas)).^2);
r_err=@(p) nansum(((r_conc(pinflate(p,p0,sd),concs_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-f_had')/(sqrt(2)*sd_rad)).^2);
rd_err=@(p) nansum(((rp_conc(pinflate(p,p0,sd),concs_had,285,fcg_had(:,2),sum(fcg_had(:,3:5),2))-fd_had')/(sqrt(2)*sd_rad)).^2);

lpr = @(p) sum((p<pdmin')+(p>pdmax'))==0;
lpr_nolong = @(p) sum((p<pdmin')+(p>pdmax_nolong'))==0;

%paleo prior on ESS - 95th percentile at 12K
%most likely value at 7K
%https://www.earth-syst-dynam-discuss.net/2/211/2011/esdd-2-211-2011-print.pdf

lgam=@(p) log(gampdf(sum(p(8:9))*3.5,7/1.061,1.061));
laer=@(p) log(normpdf(p(13),1,0.1));
lmillar_RWF=@(p) log(normpdf(((get_tcr(p)/get_sens(p))-0.6)/0.15*norminv(0.95)));
lmillar_TCR=@(p) log(lognpdf(get_tcr(p),0.5,.3));


%llhd_c=@(p) -(c_err(p));
llhd_t=@(p) -(t_err(p));
llhd_r=@(p) -(r_err(p));
llhd_rd=@(p) -(rd_err(p));




if nargout>1%
disp('With Paleo Prior')  
  [mdlpstcf,logP]=gwmcmc(p_lds,{lpr laer lgam llhd_t  llhd_r llhd_rd},n_it, ...
                         'ProgressBar',logical(1),'BurnIn',0.5,'Parallel',logical(pll));
  disp('Flat prior')
  [mdlpst,logP]=gwmcmc(p_lds,{lpr laer llhd_t llhd_r llhd_rd},n_it, ...
                       'ProgressBar',logical(1),'BurnIn',0.5,'Parallel',logical(pll));
disp('Millar')  
  [mdlpstml,logP]=gwmcmc(mdlpstcf(:,:,end),{laer lpr lmillar_TCR lmillar_RWF llhd_t  llhd_r  llhd_rd},n_it, ...
                         'ProgressBar',logical(1),'BurnIn',0.5,'Parallel',logical(pll));

end


 disp('No ocean constraint')
  [mdlpstnl,logP]=gwmcmc(p_lds,{laer lpr llhd_t}, ...
                         n_it,'ProgressBar',logical(1),'BurnIn', ...
                         0.5,'Parallel',logical(pll));
