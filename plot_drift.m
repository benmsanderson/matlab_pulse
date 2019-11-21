
figure(1)
clf

 subplot(1,2,2)

for i=[1:10:size(r_drift,2)]
  b=regress(r_drift(501:end,i),[ones(size(t_drift(501:end,i))),t_drift(501:end,i)])
  plot([-5,15],[1,1;-5,15]'*b,'-','color',[0.8,0.5,0.5],'linewidth',1)
hold on
end

 p1=plot(t_drift(501:end,[1,end]),r_drift(501:end,[1,end]),'.','color',[0.5,0.5,0.8])
 hold on
  p1=plot(t_drift(501:end,floor(size(r_drift,2)/2)),r_drift(501:end,floor(size(r_drift,2)/2)),'--','color',[0.5,0.5,0.8],'linewidth',2)

 hold on
% p2=plot(tcr_drift(:,1:10:end),tcr_drift(:,1:10:end),'color',[0.5,0.8,0.5])
% p3=plot(t_drift(2:500,1:10:end),r_drift(2:500,1:10:end),'color',[0.5,0.5,0.5])
% p1=plot(t_drift(end,1:50:end),r_drift(end,1:50:end),'x','color',[0.5,0.5,0.8],'linewidth',3)
% p1=plot(t_drift(500:501,1:50:end),r_drift(500:501,1:50:end),':','color',[0.5,0.5,0.5])


for i=1:100
  b=regress(r_drift(501:end,i),[ones(size(t_drift(501:end,i))),t_drift(501:end,i)])
  snsmat(i)=-b(1)/b(2);
end



% plot(-499:150,t_drift(:,find(driftmat==0)),'--','color',[0.5,0.5,0.8]/2,'linewidth',2)
% plot(-499:150,tcr_drift(:,find(driftmat==0)),'--','color',[0.5,0.8,0.5]/2,'linewidth',2)
% plot(-499:0,t_drift(1:500,find(driftmat==0)),'--','color',[0.5,0.5,0.5]/2,'linewidth',2)
 ylim([0,7])
 xlim([0,8])
 plot([-10,15],[0,0],'k:')
  plot([0,0],[-10,15],'k:')

%xlim([-200,150])

 
 ylabel('(Wm^{-2})')
 xlabel('(K)')

title('(b)')

 subplot(1,2,1)

 p1=plot(-499:150,t_drift(:,1:10:end),'color',[0.5,0.5,0.8])
 hold on
 p2=plot(-499:150,tcr_drift(:,1:10:end),'color',[0.5,0.8,0.5])
 p3=plot(-499:0,t_drift(1:500,1:10:end),'color',[0.5,0.5,0.5])

 plot(-499:150,t_drift(:,find(driftmat==0)),'--','color',[0.5,0.5,0.8]/2,'linewidth',2)
 plot(-499:150,tcr_drift(:,find(driftmat==0)),'--','color',[0.5,0.8,0.5]/2,'linewidth',2)
 plot(-499:0,t_drift(1:500,find(driftmat==0)),'--','color',[0.5,0.5,0.5]/2,'linewidth',2)
 ylim([-1,12])
xlim([-200,150])


pr=prctile(tcr_drift(640,:),[1,25,50,75,99])
rectangle('Position',[-20,pr(2),20,pr(4)-pr(2)],'edgecolor',[.5,.8,.5],'facecolor',[.5,.8,.5])
hold on
p3=plot(-10*[1,1],[pr(1),pr(5)],'color',[.5,.8,.5])
text(-110,pr(3),'T140','color',[.5,.8,.5])
 
pr=prctile(t_drift(640,:),[1,25,50,75,99])
rectangle('Position',[-60,pr(2),20,pr(4)-pr(2)],'edgecolor',[.5,.5,.8],'facecolor',[.5,.5,.8])
hold on
p3=plot(-50*[1,1],[pr(1),pr(5)],'color',[.5,.5,.8])
text(-150,pr(3),'A140','color',[.5,.5,.8])
 
pr=prctile(snsmat,[1,25,50,75,99])
rectangle('Position',[-40,pr(2),20,pr(4)-pr(2)],'edgecolor',[.8,.5,.5],'facecolor',[.8,.5,.5])
hold on
p3=plot(-30*[1,1],[pr(1),pr(5)],'color',[.8,.5,.5])
text(-130,pr(3),'EffCS','color',[.8,.5,.5])

 
 xlabel('years')
 ylabel('(K)')


 plot([-100,-100],[-3,10],'k:')
  plot([0,00],[-3,10],'k:')

  legend([p3(1),p2(1),p1(1)],'Drift (example model)','Drift+1pctCO2','Drift+4xCO2','location','northwest')
   title('(a)')


   set(gcf, 'PaperPosition', [0 0 7.5 3.5]);
set(gcf, 'PaperSize', [7.5 3.5]); 
print(gcf,'-dpdf','-painters',['edrift.pdf']);
