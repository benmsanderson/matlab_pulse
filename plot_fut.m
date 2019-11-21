figure(342)
clf
subplot(2,2,1)
%
plot(futdat(1)*[1,1],[0,3.5],':','color',[0.25,.25,.25]/2+0.5,'linewidth',1)
hold on

plot(futdat(2)*[1,1],[0,3.5],':','color',[0.2,.2,.75]/2+0.5,'linewidth',1)
plot(futdat(3)*[1,1],[0,3.5],':','color',[0.75,0,0]/2+0.5,'linewidth',1)

areabar(tim3000,squeeze(tomat26_fut(1,:,:))',10,[0.25,.25,.25],1,'-',0.2,0,6,1)

areabar(tim3000,squeeze(tomat26_fut(2,:,:))',10,[0.2,.2,.75],1,'-',0.2,0,6,1)
areabar(tim3000,squeeze(tomat26_fut(3,:,:))',10,[0.75,0,0],1,'-',0.2,0,6,1)
ylim([0,3.5])
xlim([1950,2300])
ylabel('T_g (K)')
xlabel('year')
title('(a) RCP2.6 (C,T, heat constraint)')
subplot(2,2,2)

plot(futdat(1)*[1,1],[0,12],':','color',[0.25,.25,.25]/2+0.5,'linewidth',1)
hold on

plot(futdat(2)*[1,1],[0,12],':','color',[0.2,.2,.75]/2+0.5,'linewidth',1)
plot(futdat(3)*[1,1],[0,12],':','color',[0.75,0,0]/2+0.5,'linewidth',1)
areabar(tim,squeeze(tomat85_fut(1,:,:))',10,[0.25,.25,.25],1,'-',0.2,0,6,1)
hold on
areabar(tim,squeeze(tomat85_fut(2,:,:))',10,[0.2,.2,.75],1,'-',0.2,0,6,1)
areabar(tim,squeeze(tomat85_fut(3,:,:))',10,[0.75,.0,.0],1,'-',0.2,0,6,1)
xlim([1950,2300])
ylim([0,12])
ylabel('T_g (K)')
xlabel('year')
title('(b) RCP8.5 (C,T, heat constraint)')
subplot(2,2,3)
bins=[0:1:40]

for i=1:3
  b85(:,i)=hist(sum(mdlpstfut85{i}(8:9,:,end),1)*3.5,bins);
  b26(:,i)=hist(sum(mdlpstfut26{i}(8:9,:,end),1)*3.5,bins);
  
  b85cf(:,i)=hist(sum(mdlpstcffut85{i}(8:9,:,end)*3.5,1),bins);
  b26cf(:,i)=hist(sum(mdlpstcffut26{i}(8:9,:,end)*3.5,1),bins);
  
  b85nl(:,i)=hist(sum(mdlpstnlfut85{i}(8:9,:,end)*3.5,1),bins);
  b26nl(:,i)=hist(sum(mdlpstnlfut26{i}(8:9,:,end)*3.5,1),bins);
  
  b85ml(:,i)=hist(sum(mdlpstmlfut85{i}(8:9,:,end)*3.5,1),bins);
  b26ml(:,i)=hist(sum(mdlpstmlfut26{i}(8:9,:,end)*3.5,1),bins);
end
p1=plot(bins,cumsum(b26(:,1))/sum(b26(:,1)),'color',[0.25,.25,.25],'linewidth',2)
hold on
p2=plot(bins,cumsum(b26(:,2))/sum(b26(:,1)),'color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b26(:,3))/sum(b26(:,1)),'color',[0.75,.0,.0],'linewidth',2)

p1=plot(bins,cumsum(b26cf(:,1))/sum(b26cf(:,1)),':','color',[0.25,.25,.25],'linewidth',2)
p2=plot(bins,cumsum(b26cf(:,2))/sum(b26cf(:,1)),':','color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b26cf(:,3))/sum(b26cf(:,1)),':','color',[0.75,.0,.0],'linewidth',2)

p1=plot(bins,cumsum(b26ml(:,1))/sum(b26ml(:,1)),'-.','color',[0.25,.25,.25],'linewidth',2)
p2=plot(bins,cumsum(b26ml(:,2))/sum(b26ml(:,1)),'-.','color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b26ml(:,3))/sum(b26ml(:,1)),'-.','color',[0.75,.0,.0],'linewidth',2)

p1=plot(bins,cumsum(b26nl(:,1))/sum(b26nl(:,1)),'--','color',[0.25,.25,.25],'linewidth',2)
p2=plot(bins,cumsum(b26nl(:,2))/sum(b26nl(:,1)),'--','color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b26nl(:,3))/sum(b26nl(:,1)),'--','color',[0.75,.0,.0],'linewidth',2)





ylim([0,1])
xlim([0,15])
plot([0,15],[0.9,0.9],'--','color',[0.8,0.8,0.8])
plot([0,15],[0.5,0.5],'--','color',[0.8,0.8,0.8])
plot([0,15],[0.1,0.1],'--','color',[0.8,0.8,0.8])
plot(sum(p0(8:9)*3.5)*[1,1],[0,1],'k-')
ylabel('Cumulative Likelihood')
xlabel('Equilibrium Climate Sensitivity (K)')
title('(c) RCP2.6')
legend([p1,p2,p3],'2020 estimation','2060 estimation','2100 estimation','location','southeast')

subplot(2,2,4)
bins=[0:1:40]

p1=plot(bins,cumsum(b85(:,1))/sum(b85(:,1)),'color',[0.25,.25,.25],'linewidth',2)
hold on
p2=plot(bins,cumsum(b85(:,2))/sum(b85(:,1)),'color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b85(:,3))/sum(b85(:,1)),'color',[0.75,.0,.0],'linewidth',2)

p1=plot(bins,cumsum(b85cf(:,1))/sum(b85cf(:,1)),':','color',[0.25,.25,.25],'linewidth',2)
p2=plot(bins,cumsum(b85cf(:,2))/sum(b85cf(:,1)),':','color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b85cf(:,3))/sum(b85cf(:,1)),':','color',[0.75,.0,.0],'linewidth',2)

p1=plot(bins,cumsum(b85nl(:,1))/sum(b85nl(:,1)),'--','color',[0.25,.25,.25],'linewidth',2)
p2=plot(bins,cumsum(b85nl(:,2))/sum(b85nl(:,1)),'--','color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b85nl(:,3))/sum(b85nl(:,1)),'--','color',[0.75,.0,.0],'linewidth',2)

p1=plot(bins,cumsum(b85ml(:,1))/sum(b85ml(:,1)),'-.','color',[0.25,.25,.25],'linewidth',2)
p2=plot(bins,cumsum(b85ml(:,2))/sum(b85ml(:,1)),'-.','color',[0.2,.2,.75],'linewidth',2)
p3=plot(bins,cumsum(b85ml(:,3))/sum(b85ml(:,1)),'-.','color',[0.75,.0,.0],'linewidth',2)


ylim([0,1])
xlim([0,15])


title('(d) RCP8.5')

ylabel('Cumulative Likelihood')
xlabel('Equilibrium Climate Sensitivity (K)')
plot([0,15],[0.9,0.9],'--','color',[0.8,0.8,0.8])
plot([0,15],[0.5,0.5],'--','color',[0.8,0.8,0.8])
plot([0,15],[0.1,0.1],'--','color',[0.8,0.8,0.8])
plot(sum(p0(8:9)*3.5)*[1,1],[0,1],'k-')

   set(gcf, 'PaperPosition', [0 0 7 5]);
set(gcf, 'PaperSize', [7 5]); 
print(gcf,'-dpdf','-painters',['fut.pdf']);


  
