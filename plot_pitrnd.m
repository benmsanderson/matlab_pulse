
figure(3)
n=0
clf
btrnd=NaN(numel(mdls),1);
sdend=NaN(numel(mdls),1);
arcoeff=NaN(numel(mdls),2);
arvar=NaN(numel(mdls),1);
clear ax psn
for i=1:numel(mdls)
if and(and(isfield(ens.(mdls{i}),'piControl'),isfield(ens.(mdls{i}),'onepctCO2')),isfield(ens.(mdls{i}),'abrupt4xCO2'))
if isfield(ens.(mdls{i}).piControl,'rsut')
if and(isfield(ens.(mdls{i}).onepctCO2,'rlut'),isfield(ens.(mdls{i}).onepctCO2,'rsut'))
if numel(ens.(mdls{i}).piControl.rlut{1})==numel(ens.(mdls{i}).piControl.rsut{1})
  n=n+1
  subplot(8,5,n)
  mn=mean(ens.(mdls{i}).piControl.tas{1});
  p1o=plot(ens.(mdls{i}).piControl.tas{1}-mn,'color',[0.7,.7,0.8])
  hold on
  p2o=plot(ens.(mdls{i}).onepctCO2.tas{1}(1:70)-mn,'color',[0.8,0.7,0.7])
  %plot(ens.(mdls{i}).abrupt4xCO2.tas{1}-mn)
  xlim([-100,500])
  ylim([-.4,.4])
  if n<27
  title(['(' char(96+n) ') ' mdls{i}],'interpreter','none')
  else
  title(['(' char(64+n-26) ') ' mdls{i}],'interpreter','none')
  end
  
  [b,bint,r,~,stats] =regress(ens.(mdls{i}).piControl.tas{1}-mn,[(1:numel(ens.(mdls{i}).piControl.tas{1}))',ones(size(ens.(mdls{i}).piControl.tas{1}))])
  p1=plot([0,500],[0,500;1,1]'*b,':','linewidth',2,'color',[0.2,0.2,0.4])
  p1a=plot([0],[0;1]'*b,'o','markerfacecolor',[0.7,0.7,0.8],'markeredgecolor',[0.2,0.2,0.4],'markersize',5)
  btrnd(i)=b(1);
  sdend(i)=std(r);
 mdl = arima(2,0,0); % 2 the lag order     
 armdl{i} = estimate(mdl,r); % y is your data
 arcoeff(i,1)=armdl{i}.AR{1};
 arcoeff(i,2)=armdl{i}.AR{2};
 arvar(i)=armdl{i}.Variance;
 

  
  [b,bint,~,~,stats] =regress(ens.(mdls{i}).onepctCO2.tas{1}(1:70)-mn,[(1:70)',ones(70,1)])
  p2=plot([0,500],[0,500;1,1]'*b,':','linewidth',2,'color',[0.4,0.2,0.2])
  p2a=plot([0],[0;1]'*b,'o','markerfacecolor',[0.8,0.7,0.7],'markeredgecolor',[0.4,0.2,0.2],'markersize',5)

  
  set(gca,'ytick',[-.4:0.2:.4])
    set(gca,'xtick',[0:200:500])
    ylabel('(K)')
if n>=33
  xlabel('year')
end

    grid on
    psn{n}=get(gca,'position')
    ax{n}=gca;
end
end
end
end
end

l=legend([p1o,p2o],'PiControl','1%CO2','location','southoutside')

n=n+1
 subplot(8,10,76:79)

 ah=hist(btrnd,[-.003:0.00025:0.003])
 bh=hist(driftamp,[-.003:0.00025:0.003])
     ax{n}=gca;
    psn{n}=get(gca,'position')

 b=bar([-.3:0.025:0.3],[bh/sum(bh);ah/sum(ah)]'*100,1)
 set(b(1),'FaceColor',[0.5,0.5,0.5])
 set(b(2),'FaceColor','k')
legend(b,'Idealized','CMIP','location','northeast')
 xlabel('Drift (K/century)')
 ylabel('Frequency')
  title(['(' char(64+n-26) ')'],'interpreter','none')

   for i=1:n
set(ax{i},'position',psn{i}+[0,0.01,0-0.01,-0.01])
   end
   set(ax{n},'position',[0.55,0.05,0.3,0.1])
clear ax psn

   set(gcf, 'PaperPosition', [0 0 8 7]);
set(gcf, 'PaperSize', [8 7]); 
print(gcf,'-dpdf','-painters',['pitrnd.pdf']);


  
argen=armdl{1};
argen.AR{1}=nanmean(arcoeff(:,1));
argen.AR{2}=nanmean(arcoeff(:,2));
argen.Variance=nanmean(arvar);
