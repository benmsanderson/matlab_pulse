
figure(5)
for j=1:4
subplot(2,2,j)
hold off

plot(ce_corr(:,1:286,2,j)',topt_corr(:,1:286,2,j)'+mean(gm_had(158:167)),'color',[0.5,0.5,0.5,0.15])
hold on
plot(ce_corr(:,287:536,2,j)',topt_corr(:,287:536,2,j)'+mean(gm_had(158:167)),'color',[0.75,.75,.9,0.15])

  
hold on

pp=plot(ce_corr(:,287:536,1,j)',topt_corr(:,287:536,1,j)'+mean(gm_had(158:167)),'color',[0.6500    0.9000    0.6500,0.15])
plot(ce_corr(1,85+(1:167),1,j)',gm_had,'color','k','linewidth',j)

%ah=hist(ce_corr(:,336,1,j),[-500:200:1500])
%plot([-500:200:1500],ah/max(ah)/5,'--','color',[0.3,0.8,0.3])

%ah=hist(ce_corr(:,336,2,j),[-500:200:1500])
%plot([-500:200:1500],ah/max(ah)/5,'--','color',[0.5,0.5,0.8])

cols={[0.3,.8,.3]/2+.5,[0.5,0.5,0.8]/2+0.5}

clear ah
for i=1:2
  ah(:,i)=prctile(ce_corr(:,500,i,j),[5,25,50,75,95]);
end
for i=1:2
  plot(ah([1,5],i),0.25*i*[1,1],'-','color',cols{i})
  
  hold on
  plot(ah([2,4],i),0.25*i*[1,1],'-','color',cols{i},'linewidth',2)
    plot(ah([3],i)*[1,1],0.25*i+[-.1,.1],'-','color',cols{i},'linewidth',2)
    t=text(ah([3],i)+20,0.25*i,[num2str(targ(i)) '^oC'])
   set(t,'VerticalAlignment','bottom','Color',cols{i})
end



xlabel({'Post-2010 Cumulative','CO_2 Emissions (GtC)'})
ylabel('Temperature above 1850 (K)')
xlim([-500,1500])
ylim([0,2.5])
grid on
title(['(' char(96+j) ') ' prnm{j} ]) 
end

   
   set(gcf, 'PaperPosition', [0 0 9 8]);
set(gcf, 'PaperSize', [9 8]); 
print(gcf,'-dpdf','-painters',['budget_plume.pdf']);
