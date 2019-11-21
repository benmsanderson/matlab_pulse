

figure(25)
clf
bins=[0:0.5:20];
subplot(2,1,1)
a=hist(gregmatnl/2,bins)
p1=plot(bins,cumsum(a)/sum(a),'k--','linewidth',2)
hold on
ao=hist(gregmat/2,bins)
p2=plot(bins,cumsum(ao)/sum(ao),'k-','linewidth',2)
aor=hist(gregmatml/2,bins)
p3=plot(bins,cumsum(aor)/sum(aor),'k-.','linewidth',2)
ap=hist(gregmatcf/2,bins)
p4=plot(bins,cumsum(ap)/sum(ap),'k:','linewidth',2)
bins=[0:0.1:20];

a=hist(tcrmatnl,bins)
p1=plot(bins,cumsum(a)/sum(a),'--','linewidth',2,'color',[0.8,0.5,0.5])
hold on
ao=hist(tcrmat,bins)
p2=plot(bins,cumsum(ao)/sum(ao),'-','linewidth',2,'color',[0.8,0.5,0.5])
aor=hist(tcrmatml,bins)
p3=plot(bins,cumsum(aor)/sum(aor),'-.','linewidth',2,'color',[0.8,0.5,0.5])
ap=hist(tcrmatcf,bins)
p4=plot(bins,cumsum(ap)/sum(ap),':','linewidth',2,'color',[0.8,0.5,0.5])
bins=[0:0.5:20];

a=hist(sum(mdlpstnl(8:9,:,end),1)*5.35*log(2),bins)
p1=plot(bins,cumsum(a)/sum(a),'--','linewidth',2,'color',[0.5,0.5,0.8])
hold on
ao=hist(sum(mdlpst(8:9,:,end),1)*5.35*log(2),bins)
p2=plot(bins,cumsum(ao)/sum(ao),'-','linewidth',2,'color',[0.5,0.5,0.8])
aor=hist(sum(mdlpstml(8:9,:,end),1)*5.35*log(2),bins)
p3=plot(bins,cumsum(aor)/sum(aor),'-.','linewidth',2,'color',[0.5,0.5,0.8])
ap=hist(sum(mdlpstcf(8:9,:,end),1)*5.35*log(2),bins)
p4=plot(bins,cumsum(ap)/sum(ap),':','linewidth',2,'color',[0.5,0.5,0.8])


ax=gca;

xlim([0,10])
set(gca,'ytick',[0.1,0.25,0.5,0.75,0.9])
grid on

xlabel('(K)')
ylabel('iikelihood')
title('Posterior likelihood for climate indicators')


   subplot(2,1,2)

   plot([100,200],[8,8],'--k','linewidth',2)
   hold on
   plot([250,350],[8,8],'-k','linewidth',2)
   plot([400,500],[8,8],'-.k','linewidth',2)
   plot([550,650],[8,8],':k','linewidth',2)

   hold on
 
   plot([100,200],[7,7],'--','linewidth',2,'color',[0.5,0.5,0.8])
   hold on
   plot([250,350],[7,7],'-','linewidth',2,'color',[0.5,0.5,0.8])
   plot([400,500],[7,7],'-.','linewidth',2,'color',[0.5,0.5,0.8])
   plot([550,650],[7,7],':','linewidth',2,'color',[0.5,0.5,0.8])

   plot([100,200],[6,6],'--','linewidth',2,'color',[0.8,0.5,0.5])
   hold on
   plot([250,350],[6,6],'-','linewidth',2,'color',[0.8,0.5,0.5])
   plot([400,500],[6,6],'-.','linewidth',2,'color',[0.8,0.5,0.5])
   plot([550,650],[6,6],':','linewidth',2,'color',[0.8,0.5,0.5])



%   text(50,9,'Prior','FontWeight','bold','HorizontalAlignment','right')
   text(50,5,'Constraint','FontWeight','bold','HorizontalAlignment','right','VerticalAlignment','top')

   text(700,8,'EffCS','fontweight','bold')
   text(700,7,'ECS','fontweight','bold')
   text(700,6,'TCR','fontweight','bold')
%   text(100,9,'Flat')
   text(100,5,{'C,T'},'VerticalAlignment','top')
 %  text(250,9,'Flat')
   text(250,5,{'C,T','heat'},'VerticalAlignment','top')
 %  text(550,9,'Paleo')
   text(550,5,{'C,T','Paleo'},'VerticalAlignment','top')
 %  text(400,9,'Flat')
   text(400,5,{'C,T','RWF'},'VerticalAlignment','top')


   axis([-250,1050,0,10])
   set(gca,'XTick',[])
   set(gca,'YTick',[]) 
   
   set(gca,'position',[0.56,0.65,0.38,0.23])
   set(ax,'position',[0.1,0.1,0.8,0.8])

   set(gcf, 'PaperPosition', [0 0 8 5]);
set(gcf, 'PaperSize', [8 5]); 
print(gcf,'-dpdf','-painters',['ccpdfs.pdf']);

