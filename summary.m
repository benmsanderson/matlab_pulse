	 
figure(1)
clf
subplot(2,2,1)
p1=areabar(tim3000(1:276),topt(:,1:276,1,1)',10,[0.3,0.3,0.3])
p2=areabar(tim3000(277:end),topt(:,277:end,1,1)',10,[0.3,0.8,0.3])
xlim([1950,2250])
hold on
p3=areabar(tim3000(277:end),topt(:,277:end,2,1)',10,[0.5,0.5,0.8])
grid on
xlabel('Year')
ylabel('Temperature (K)')
plot([2040,2040],[0,2.5],'-k')
p0=plot(tim3000(1:256),mean(topt(:,1:256,1,1)',2),'-k','linewidth',2)
%text(2055,0.25,'Adaptive period')
legend([p0,p1,p2,p3],'Historical','Uninformed','Adaptive 1.5C','Adaptive 2.0C','location','southeast')
title('(a)') 
ax1=gca;

subplot(2,2,2)
areabar(tim3000(1:276),eopt(:,1:276,1,1)',10,[0.3,0.3,0.3])
xlim([1950,2250])
hold on
plot(tim3000(1:256),eopt(:,1:256,1,1)','k-','linewidth',2)

areabar(tim3000(277:end),eopt(:,277:end,1,1)',10,[0.3,0.8,0.3])


areabar(tim3000(277:end),eopt(:,277:end,2,1)',10,[0.5,0.5,0.8])
grid on
xlabel('Year')
ylabel('CO_2 Emissions (GtC)')
plot([2040,2040],[-20,30],'-k')

title('(b)') 
ax2=gca;

subplot(2,2,3)
hold off
hold on
plot(ce_corr(:,277:536,2,1)',topt_corr(:,277:536,2,1)'+mean(gm_had(158:167)),'color',[0.75,.75,.9,0.15])

  
hold on

pp=plot(ce_corr(:,277:536,1,1)',topt_corr(:,277:536,1,1)'+mean(gm_had(158:167)),'color',[0.6500    0.9000    0.6500,0.15])
plot(ce_corr(:,1:276,2,1)',topt_corr(:,1:276,2,1)'+mean(gm_had(158:167)),'color',[0.5,0.5,0.5,0.05])

plot(ce_corr(1,85+(1:167),1,1)',gm_had,'color','k','linewidth',1)

%ah=hist(ce_corr(:,336,1,1),[-500:200:1500])
%plot([-500:200:1500],ah/max(ah)/5,'--','color',[0.3,0.8,0.3])

%ah=hist(ce_corr(:,336,2,1),[-500:200:1500])
%plot([-500:200:1500],ah/max(ah)/5,'--','color',[0.5,0.5,0.8])

cols={[0.3,.8,.3]/2+.5,[0.5,0.5,0.8]/2+0.5}

clear ah
for i=1:2
  ah(:,i)=prctile(ce_corr(:,336,i,1),[5,25,50,75,95]);
end
for i=1:2
  plot(ah([1,5],i),0.25*i*[1,1],'-','color',cols{i},'linewidth',2)
  
  hold on
  plot(ah([2,4],i),0.25*i*[1,1],'-','color',cols{i},'linewidth',4)
    plot(ah([3],i)*[1,1],0.25*i+[-.05,.05],'-','color',cols{i},'linewidth',2)
    t=text(ah([3],i)+20,0.25*i,[num2str(targ(i)) '^oC'])
   set(t,'VerticalAlignment','bottom','Color',cols{i})
end




xlabel({'Post-2020 Cumulative','CO_2 Emissions (GtC)'})
ylabel('Temperature above 1850 (K)')

xlim([-500,1500])
ylim([0,2.5])
grid on
plot([-500,1500],[mean(gm_had(158:167)),mean(gm_had(158:167))],':','color',[0.6,0.6,0.6])
plot(mean(ce_corr(:,241:251,1,1),2),mean(gm_had(158:167)),'xk')
title('(c)') 
ax3=gca;

ax3_pos = ax3.Position; % position of first axes
ax4 = axes('Position',ax3_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
ylabel({'Temperature above 2006-2015 (K)'})
ylim([0,2.5]-mean(gm_had(158:167)))
set(gca,'xtick',[])
ax4.XColor = [0.6,0.6,0.6];
ax4.YColor = [0.6,0.6,0.6];


subplot(2,2,4)
hold off
areabar(tim3000(256:276),ce_corr(:,256:276,1,1)',10,[0.3,0.3,0.3]);
hold on
areabar(tim3000(277:end),ce_corr(:,277:end,1,1)',10,[0.3,0.8,0.3]);
xlim([1960,2300])
ylim([-500,1200])

hold on
budg_tcre=(1.5-mean(gm_had(158:167)))./tcrematnl*1000/44*12;
topt_nco=mean(topt(:,242:251,1,1)-topt_co(:,242:251,1,1),2);
budg_nco=(1.5-mean(gm_had(158:167)-topt_nco'))./tcrematnl(1:numel(topt_nco))*1000/44*12;

pr_tc=prctile(budg_tcre,[10,25,50,75,90])
pr_nco=prctile(budg_nco,[10,25,50,85,90])

plot([1980,1980],pr_tc([1,5]),'color',[0.3,0.8,0.3],'linewidth',1)
plot([1980,1980],pr_tc([2,4]),'color',[0.3,0.8,0.3],'linewidth',2)
plot([1980],pr_tc([3]),'+','color',[0.3,0.8,0.3],'linewidth',2)

plot([2010,2010],pr_nco([1,5]),'color',[0.3,0.8,0.3],'linewidth',1)
plot([2010,2010],pr_nco([2,4]),'color',[0.3,0.8,0.3],'linewidth',2)
plot([2010],pr_nco([3]),'x','color',[0.3,0.8,0.3],'linewidth',2)


 areabar(tim3000(277:end),ce_corr(:,277:end,2,1)',10,[0.5,0.5,0.8]);

 
budg_tcre=(2-mean(gm_had(158:167)))./tcrematnl*1000/44*12;
topt_nco=mean(topt(:,242:251,1,1)-topt_co(:,242:251,1,1),2);
budg_nco=(2-mean(gm_had(158:167)-topt_nco'))./tcrematnl(1:numel(topt_nco))*1000/44*12;

pr_tc=prctile(budg_tcre,[10,25,50,75,90])
pr_nco=prctile(budg_nco,[10,25,50,85,90])

plot([1980,1980],pr_tc([1,5]),'color',[0.5,0.5,0.8],'linewidth',1)
plot([1980,1980],pr_tc([2,4]),'color',[0.5,0.5,0.8],'linewidth',2)
plot([1980],pr_tc([3]),'+','color',[0.5,0.5,0.8],'linewidth',2)

plot([2010,2010],pr_nco([1,5]),'color',[0.5,0.5,0.8],'linewidth',1)
plot([2010,2010],pr_nco([2,4]),'color',[0.5,0.5,0.8],'linewidth',2)
plot([2010],pr_nco([3]),'x','color',[0.5,0.5,0.8],'linewidth',2)

%errorbar(1980,pr_tc(2),pr_tc(2)-pr_tc(1),pr_tc(3)-pr_tc(2),'marker','x','color',[0.5,0.5,0.8],'linewidth',1)
%errorbar(2010,pr_nco(2),pr_nco(2)-pr_nco(1),pr_nco(3)-pr_nco(2),'marker','d','color',[0.5,0.5,0.8],'linewidth',1)

ylabel({'Post 2020 Cumulative','Emissions budget (GtC)'})
xlabel('Accounting date')


ax5=gca;
grid on
title('(d)') 
 pause(2)
set(ax1,'position',[0.08,0.55,0.38,0.36])
set(ax2,'position',[0.6,0.55,0.38,0.36])
set(ax3,'position',[0.08,0.1,0.38,0.36])
set(ax4,'position',[0.08,0.1,0.38,0.36])
set(ax5,'position',[0.6,0.1,0.38,0.36])



   
   set(gcf, 'PaperPosition', [0 0 10 8]);
set(gcf, 'PaperSize', [10 8]); 
print(gcf,'-dpdf','-painters',['budget.pdf']);


  
