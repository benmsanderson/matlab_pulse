prnm={'C,T constraints','C,T,heat constraints','C,T,RWF constraints','C,T,Paleo constraints'};

figure(2)
clf

hold off
for i=1:4
  subplot(2,2,i)
    areabar(tim3000(246:286),ce_corr(:,246:286,1,i)',10,[0.3,0.3,0.3]);
hold on
  areabar(tim3000(286:end),ce_corr(:,286:end,1,i)',10,[0.3,0.8,0.3]);
xlim([1960,2300])
ylim([-300,1000])
topt_nco=mean(topt(:,242:251,1,i)-topt_co(:,242:251,1,i),2);

hold on
switch i
  case 1
budg_tcre=(1.5-mean(gm_had(158:167)))./tcrematnl*1000/44*12;
budg_nco=(1.5-mean(gm_had(158:167)-topt_nco'))./tcrematnl(1:numel(topt_nco))*1000/44*12;
 case 2
budg_tcre=(1.5-mean(gm_had(158:167)))./tcremat*1000/44*12;
budg_nco=(1.5-mean(gm_had(158:167)-topt_nco'))./tcremat(1:numel(topt_nco))*1000/44*12;
 case 3
budg_tcre=(1.5-mean(gm_had(158:167)))./tcrematml*1000/44*12;
budg_nco=(1.5-mean(gm_had(158:167)-topt_nco'))./tcrematml(1:numel(topt_nco))*1000/44*12;
 case 4
budg_tcre=(1.5-mean(gm_had(158:167)))./tcrematcf*1000/44*12;
budg_nco=(1.5-mean(gm_had(158:167)-topt_nco'))./tcrematcf(1:numel(topt_nco))*1000/44*12;
end


pr_tc=prctile(budg_tcre,[10,50,90])
pr_nco=prctile(budg_nco,[10,50,90])

errorbar(1980,pr_tc(2),pr_tc(2)-pr_tc(1),pr_tc(3)-pr_tc(2),'marker','x','color',[0.3,0.8,0.3],'linewidth',1)
errorbar(2010,pr_nco(2),pr_nco(2)-pr_nco(1),pr_nco(3)-pr_nco(2),'marker','d','color',[0.3,0.8,0.3],'linewidth',1)

 areabar(tim3000(286:end),ce_corr(:,286:end,2,i)',10,[0.5,0.5,0.8]);
topt_nco=mean(topt(:,242:251,1,1)-topt_co(:,242:251,1,1),2);

 switch i
  case 1
budg_tcre=(2-mean(gm_had(158:167)))./tcrematnl(1:numel(topt_nco))*1000/44*12;
budg_nco=(2-mean(gm_had(158:167)-topt_nco'))./tcrematnl(1:numel(topt_nco))*1000/44*12;
  case 2
budg_tcre=(2-mean(gm_had(158:167)))./tcremat(1:numel(topt_nco))*1000/44*12;
budg_nco=(2-mean(gm_had(158:167)-topt_nco'))./tcremat(1:numel(topt_nco))*1000/44*12;
  case 3
budg_tcre=(2-mean(gm_had(158:167)))./tcrematml(1:numel(topt_nco))*1000/44*12;
budg_nco=(2-mean(gm_had(158:167)-topt_nco'))./tcrematml(1:numel(topt_nco))*1000/44*12;
  case 4
budg_tcre=(2-mean(gm_had(158:167)))./tcrematcf(1:numel(topt_nco))*1000/44*12;
budg_nco=(2-mean(gm_had(158:167)-topt_nco'))./tcrematcf(1:numel(topt_nco))*1000/44*12;
 end
 
pr_tc=prctile(budg_tcre,[10,50,90])
pr_nco=prctile(budg_nco,[10,50,90])

errorbar(1980,pr_tc(2),pr_tc(2)-pr_tc(1),pr_tc(3)-pr_tc(2),'marker','x','color',[0.5,0.5,0.8],'linewidth',1)
errorbar(2010,pr_nco(2),pr_nco(2)-pr_nco(1),pr_nco(3)-pr_nco(2),'marker','d','color',[0.5,0.5,0.8],'linewidth',1)

ylabel({'Post 2010 Cumulative','Emissions budget (GtC)'})
xlabel('Accouting date')

grid on
title(['(' char(96+i) ') ' prnm{i} ]) 

end 



   
   set(gcf, 'PaperPosition', [0 0 9 8]);
set(gcf, 'PaperSize', [9 8]); 
print(gcf,'-dpdf','-painters',['budget_ps.pdf']);


  
  
