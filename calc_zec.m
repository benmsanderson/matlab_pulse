
  emis_2050=emis_26;
  emis_2050(256:285)=emis_2050(256)*linspace(1,0,30);
  emis_2050(286:end)=0;

  p0=defparams;
tsplmat=[2010,2020,2050,2100,2200,2500,2764]
esplmat=[emis_26(246),emis_26(256),0,-2,0,0,0]


minmat=[2010,2020,2030,2070,2100,2301,2764,emis_26(246),emis_26(256),-20,-20,-10,-10,-10];
maxmat=[2010,2020,2060,2090,2300,2600,2764,emis_26(246),emis_26(256),20,20,10,10,10];
				
%minmat=[2010,2020,2050,2060,2101,2301,2764,emis_26(246),emis_26(256),0,-40,-10,-10,-10];
%maxmat=[2010,2020,2050,2100,2300,2600,2764,emis_26(246),emis_26(256),0,10,10,10,10];
				%SPINES - optimize the SPLINES!!!pl

mc_ems=(rand(size(mdlpst,2),1)*24-8)*2.12;

if 1
clear tgopt* egopt ppgopt
  p = pchip(tsplmat,esplmat,[2010:2500]);
  emfun = @(p) [emis_26(1:245)' pchip(p(1:numel(tsplmat)),p(numel(tsplmat)+(1:numel(tsplmat))),2010:2764)];
  opts=optimoptions('fmincon');
  opts.Display='off';
  targ=[1.5,2];
  for k=1:4
    k
    for j=1:numel(targ)
      disp([num2str(targ(j)) 'C target'])
      for i=1:20%size(mdlpst,2)
	      minmat(10)=mc_ems(i);
	      maxmat(10)=mc_ems(i);
i
      switch k
	case 1
	  
	       efun=@(p) sum((((t_cfdb(pinflate(mdlpstnl(:,i,end),p0,sd),emfun(p)/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2))-targ(j)).*[zeros(1,296),ones(1,704)]').^2),1);
  ppgopt(i,:)=fmincon(efun,[tsplmat,esplmat],[],[],[],[],minmat,maxmat,[],opts);
  tgopt(i,:,j,k)=t_cfdb(pinflate(mdlpstnl(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tgopt_co(i,:,j,k)=t_cfdb(pinflate(mdlpstnl(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2)*0,sum(fcg_26(:,3:end),2)*0);
	     
	case 2
	    efun=@(p) sum((((t_cfdb(pinflate(mdlpst(:,i,end),p0,sd),emfun(p)/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2))-targ(j)).*[zeros(1,296),ones(1,404),zeros(1,300)]').^2),1);
  ppgopt(i,:)=fmincon(efun,[tsplmat,esplmat],[],[],[],[],minmat,maxmat,[],opts);
  tgopt(i,:,j,k)=t_cfdb(pinflate(mdlpst(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tgopt_co(i,:,j,k)=t_cfdb(pinflate(mdlpst(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2)*0,sum(fcg_26(:,3:end),2)*0);
        case 3
	  	       	       efun=@(p) sum((((t_cfdb(pinflate(mdlpstml(:,i,end),p0,sd),emfun(p)/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2))-targ(j)).*[zeros(1,296),ones(1,404),zeros(1,300)]').^2),1);
  ppgopt(i,:)=fmincon(efun,[tsplmat,esplmat],[],[],[],[],minmat,maxmat,[],opts);
  tgopt(i,:,j,k)=t_cfdb(pinflate(mdlpstml(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tgopt_co(i,:,j,k)=t_cfdb(pinflate(mdlpstml(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2)*0,sum(fcg_26(:,3:end),2)*0);
	     case 4
  efun=@(p) sum((((t_cfdb(pinflate(mdlpstcf(:,i,end),p0,sd),emfun(p)/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2))-targ(j)).*[zeros(1,296),ones(1,404),zeros(1,300)]').^2),1);
  ppgopt(i,:)=fmincon(efun,[tsplmat,esplmat],[],[],[],[],minmat,maxmat,[],opts);
  tgopt(i,:,j,k)=t_cfdb(pinflate(mdlpstcf(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2),sum(fcg_26(:,3:end),2));
  tgopt_co(i,:,j,k)=t_cfdb(pinflate(mdlpstcf(:,i,end),p0,sd),emfun(ppgopt(i,:))/2.12,285,fcg_26(:,2)*0,sum(fcg_26(:,3:end),2)*0);
      end
  egopt(i,:,j,k)=    emfun(ppgopt(i,:));
end
  end
end

cegopt=cumsum(egopt,2);

tgopt_corr=tgopt-repmat(mean(tgopt(:,242:251,:,:),2),1,1000,1,1);

ce_gcorr=cegopt-repmat(mean(cegopt(:,256,:,:),2),1,1000,1,1);
save('emisgopt3.mat','tgopt','tgopt_co','egopt','cegopt','tgopt_corr','ce_gcorr','targ')

else
  load('emisgopt3.mat')
end

	 
