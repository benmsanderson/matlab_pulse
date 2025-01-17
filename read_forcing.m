

[gm_had,ts_had]=read_hadley();
[tim emis_had]=read_emis('RCP85',ts_had);
[tim fcg_had fcg_pd]=read_nonco2('RCP85',ts_had);
[tim_had concs_had]=read_concs('RCP85',ts_had);
[tim concs_85]=read_concs('RCP85');

fcg=sum(fcg_had(:,2:end),2);

[tim21 fcg_26 fcg_pd]=read_nonco2('RCP3PD');
[tim21 emis_26]=read_emis('RCP3PD')

[tim21 fcg_26_ne fcg_pd]=read_nonco2('RCP45SCP45TO3PD');
[tim21 emis_26_ne]=read_emis('RCP45SCP45TO3PD')

%emis_26_ne=emis_26;
%emis_26_ne(find(and(emis_26<.05,tim21'>2000)))=.05;
emis_26(537:1000)=emis_26(end);
emis_26_ne(537:1000)=emis_26_ne(end);
%fcg_26_ne=fcg_26;
fcg_26_ne(537:1000,:)=repmat(fcg_26_ne(536,:),numel(537:1000),1);
fcg_26(537:1000,:)=repmat(fcg_26(536,:),numel(537:1000),1);

[tim21 fcg_85 fcg_pd]=read_nonco2('RCP85');
[tim21 emis_85]=read_emis('RCP85');
tim3000=1764+[1:1000];

  sd_tas=std(ens.CCSM4.piControl.tas{1});
  sd_rad=std(ens.CCSM4.piControl.rlut{1}+ens.CCSM4.piControl.rsut{1});
  
  
  sd_co2=std(concs_had(1:50)); 

  [h_shallow,h_shallow_lim]=o_2000(ts_had);
  [h_deep,h_deep_lim]=b_2000(ts_had);
  n_deep=[0,diff(h_deep)/3600/24/365*10^21/510e12]; %Wm^-2
  n_shallow=[0,diff(h_shallow)/3600/24/365*10^21/510e12]; %Wm^-2

  rp_had=[n_deep;n_shallow]';
  f_had=-n_deep-n_shallow;
  fd_had=-n_deep;

  sd_rad=nanstd(f_had);
