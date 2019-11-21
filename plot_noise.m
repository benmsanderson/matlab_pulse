
figure(1)
clf




 subplot(3,2,1)

 p1=plot(1:150,both_tens((end-149):end,:),'color',[0.5,0.5,0.8,0.05])
 hold on
 p1=plot(1:150,mean(both_tens((end-149):end,:),2),'color',[0.5,0.5,0.8])

 p2=plot(1:150,both_tcrens((end-149):end,:),'color',[0.5,0.8,0.5,0.05])
 p2=plot(1:150,mean(both_tcrens((end-149):end,:),2),'color',[0.5,0.8,0.5])

 p3=plot(-499:0,both_tens(1:500,:),'color',[0.5,0.5,0.5,0.01])
 p3=plot(-499:0,mean(both_tens(1:500,:),2),'color',[0.5,0.5,0.5])

 ylim([-2,10])
xlim([-400,150])

 
 xlabel('years')
 ylabel('(K)')


 plot([-100,-100],[-5,15],'k:')
  plot([0,00],[-5,15],'k:')

  legend([p3(1),p2(1),p1(1)],'Drift+noise (control)','Drift+noise+1pctCO2','Drift+noise+4xCO2','location','northwest')
   title('(a)')

 subplot(3,2,2)
 plot(gregmat_both,gregmat,'.','color',[0.5,0.5,0.8],'markersize',6)
 [b,~,~,~,stats]=regress(gregmat',[gregmat_both']);
 hold on
 p11=plot([0,15],[0,15]'*b,':','linewidth',1.5,'color',[0.5,0.5,0.8])


% plot(tcr4mat_both,gregmat,'.','color',[0.5,0.8,0.5],'markersize',6)
% [b,~,~,~,stats2]=regress(gregmat',[tcr4mat_both',ones(size(gregmat_both'))]);
% hold on
% p12=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.8,0.5])

% plot(tcr4fit,gregmat,'.','color',[0.8,0.5,0.5],'markersize',6)
% [b,~,~,~,stats3]=regress(gregmat',[tcr4fit',ones(size(gregmat_both'))]);
% hold on
% p13=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.8,0.5,0.5])




 
 legend([p11],['EffCS R^2=' num2str(stats(1),2)],'location','northwest')
% legend([p11,p12,p13],['EffCS R^2=' num2str(stats(1),2)],['T140 R^2=' num2str(stats2(1),2)],['T140 (4xCO2 fit) R^2=' num2str(stats3(1),2)],'location','northwest')
 ylabel('True EffCS (K)')
 xlabel('Measured (K)')
 axis([0,15,0,15])
 title('(b)')

 subplot(3,2,4)
 p1=plot(tcr4mat_both,tcr4mat,'.','color',[0.5,0.8,0.5],'markersize',6)
  [b,~,~,~,stats]=regress(tcr4mat',[tcr4mat_both',ones(size(tcr4mat_both'))]);
 hold on
 p11=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.8,0.5])

 hold on
 p2=plot(gregmat_both,tcr4mat,'.','color',[0.5,0.5,0.8],'markersize',6)
 [b,~,~,~,stats2]=regress(tcr4mat',[gregmat_both',ones(size(tcr4mat_both'))]);
 hold on
 p12=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.5,0.8])

 hold on
 p3=plot(both_a140,tcr4mat,'.','color',[0.8,0.5,0.5],'markersize',6)
 [b,~,~,~,stats3]=regress(tcr4mat',[both_a140',ones(size(tcr4mat_drift'))]);
 hold on
 p13=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.8,0.5,0.5])

 legend([p11,p12,p13],['T140 R^2=' num2str(stats(1),2)],['EffCS R^2=' num2str(stats2(1),2)],['A140 R^2=' num2str(stats3(1),2)],'location','northwest')
 
 ylabel('True T140 (K)')
  xlabel('Measured (K)')
 title('(d)')
 axis([0,15,0,15])

 subplot(3,2,3)
 p1=plot(both_a140,abs(stmat(:,150)'),'.','color',[0.5,0.8,0.5],'markersize',6)
  [b,~,~,~,stats]=regress(stmat(:,150),[both_a140',ones(size(tcr4mat_both'))]);
 hold on
 p11=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.8,0.5])
 ylabel('True A140 (K)')
  xlabel('Measured (K)')
 title('(c)')
 axis([0,15,0,15])
 legend([p11],['A140 R^2=' num2str(stats(1),2)],'location','northwest')


 subplot(3,2,5)
 p1=plot(tcr4mat_both,tomat26(:,335)-tomat26(:,235),'.','color',[0.5,0.8,0.5],'markersize',6)
  [b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[tcr4mat_both',ones(size(tcr4mat_both'))]);
 hold on
 p11=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.8,0.5])

 hold on
 p2=plot(gregmat_both,tomat26(:,335)-tomat26(:,235),'.','color',[0.5,0.5,0.8],'markersize',6)
 [b,~,~,~,stats2]=regress(tomat26(:,335)-tomat26(:,235),[gregmat_both',ones(size(tcr4mat_both'))]);
 hold on
 p12=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.5,0.8])

 hold on
 p3=plot(both_a140,tomat26(:,335)-tomat26(:,235),'.','color',[0.8,0.5,0.5],'markersize',6)
 [b,~,~,~,stats3]=regress(tomat26(:,335)-tomat26(:,235),[both_a140',ones(size(tcr4mat_drift'))]);
 hold on
 p13=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.8,0.5,0.5])

 legend([p11,p12,p13],['T140 R^2=' num2str(stats(1),2)],['EffCS R^2=' num2str(stats2(1),2)],['A140 R^2=' num2str(stats3(1),2)],'location','northwest')
 
 ylabel('RCP2.6 2000-2100 warming (K)')
  xlabel('Measured (K)')
 title('(e)')
 axis([0,15,0,5])

 
 subplot(3,2,6)
 p1=plot(tcr4mat_both,tomat85(:,335)-tomat85(:,235),'.','color',[0.5,0.8,0.5],'markersize',6)
  [b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[tcr4mat_both',ones(size(tcr4mat_both'))]);
 hold on
 p11=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.8,0.5])

 hold on
 p2=plot(gregmat_both,tomat85(:,335)-tomat85(:,235),'.','color',[0.5,0.5,0.8],'markersize',6)
 [b,~,~,~,stats2]=regress(tomat85(:,335)-tomat85(:,235),[gregmat_both',ones(size(tcr4mat_both'))]);
 hold on
 p12=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.5,0.5,0.8])

 hold on
 p3=plot(both_a140,tomat85(:,335)-tomat85(:,235),'.','color',[0.8,0.5,0.5],'markersize',6)
 [b,~,~,~,stats3]=regress(tomat85(:,335)-tomat85(:,235),[both_a140',ones(size(tcr4mat_drift'))]);
 hold on
 p13=plot([0,15],[0,15;1,1]'*b,':','linewidth',1.5,'color',[0.8,0.5,0.5])

 legend([p11,p12,p13],['T140 R^2=' num2str(stats(1),2)],['EffCS R^2=' num2str(stats2(1),2)],['A140 R^2=' num2str(stats3(1),2)],'location','northwest')
 
 ylabel('RCP8.5 2000-2100 warming (K)')
  xlabel('Measured (K)')
 title('(f)')
 axis([0,15,2,7])

 
 
   set(gcf, 'PaperPosition', [0 0 7 7]);
set(gcf, 'PaperSize', [7 7]); 
print(gcf,'-dpdf','-painters',['drift.pdf']);
