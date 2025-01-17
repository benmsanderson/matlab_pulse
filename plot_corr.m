

 
figure(2)
clf
  figure(1)
  clf

  subplot(3,2,1)
  % plot(tim21,tomat85','color',[0.7,0.4,0.4])
 % p85=areabar(tim21,tomat85',10,[0.7,0.4,0.4],0,'-',0.2,3,3);
 
  hold on
			     %    p85ml=areabar(tim21,tomat85ml',10,[0.7,0.4,0.4],1,'-.',0.7);

    p85=areabar(tim21,tomat85',10,[0.7,0.4,0.4],5,'-',0.7,0,3);

%   p85cf=areabar(tim21,tomat85cf',10,[0.7,0.4,0.4],1,':');
 %  p85nl=areabar(tim21,tomat85nl',10,[0.7,0.4,0.4],0,'--');


   hold on
   %   plot(tim3000,tomat26ne','color',[0.4,0.4,0.7])
   %  p26n=areabar(tim3000,tomat26ne',5,[0.4,0.7,0.4],0)
   %   p26ncf=areabar(tim3000,tomat26necf',5,[0.4,0.7,0.4])
          %     p26nnl=areabar(tim3000,tomat26nenl',5,[0.4,0.7,0.4],0,'--')

   %   plot(tim21,tomat26','color',[0.4,0.7,0.4])

 %        p26cf=areabar(tim3000,tomat26ml',10,[0.4,0.4,0.7],1,'-.',0.7);

      p26=areabar(tim3000,tomat26',5,[0.4,0.4,0.7],1,'-',0.7,0,3);
  %    p26cf=areabar(tim3000,tomat26cf',10,[0.4,0.4,0.7],0,':');
  %    [p26nl,a]=areabar(tim3000,tomat26nl',10,[0.4,0.4,0.7],0,'--');
      
%      p26ne=areabar(tim3000,tomat26ne',10,[0.4,0.7,0.4],0,'-');
 %   p26necf=areabar(tim3000,tomat26necf',10,[0.4,0.7,0.4],0,':');
%    p26nenl=areabar(tim3000,tomat26nenl',10,[0.4,0.7,0.4],0,'--');
%    p26neml=areabar(tim3000,tomat26neml',10,[0.4,0.7,0.4],0,'-.',0.7);

   ph=plot(tim_had,gm_had,'k','linewidth',2);
legend([p85,p26,ph],'RCP8.5','RCP2.6','HadCRUT','location','northwest')
   xlim([1870,2150]);
   ylim([-1,8]);
   xlabel('Year');
   ylabel({'Global mean temperature','above 1850 (T_g, K)'});
   title('(a)');
  

   subplot(3,2,2)

for i=1:400
  b2=regress(stmat((i),:)',[srmat((i),:)',ones(size(srmat,2),1)]);
  tmpgr(i)=b2(2);
 end

 
pr=prctile(tmpgr     ,[1,25,50,75,99])
rectangle('Position',[10,pr(2),10,pr(4)-pr(2)],'edgecolor',[.8,.8,.8],'facecolor',[.5,.5,.5])
hold on
p3=plot(15*[1,1],[pr(1),pr(5)],'color',[.5,.5,.5])
  p2=areabar(1:150,stmat(:,:)',5,[0.5,.8,0.5],1,'-',0.7,0,3)

p1=areabar(1:150,stcrmat(:,:)',5,[0.7,.5,0.7],1,'-',0.7,0,3)
hold on
hold on
title('(b)')
ylabel('Warming above control (K)')
legend([p1,p2,p3],'1pctCO2','abrupt4xCO2','EffCS','location','southeast')

subplot(3,2,3)
 p1=plot(tcr4mat,tomat85(:,335)-tomat85(:,235),'.','markersize',10,'color',[0.8,0.4,0.4])
 hold on
 [b,~,~,~,stats]=regress((tomat85(:,335)-tomat85(:,235)),[tcr4mat;ones(size(tcr4mat))]');
 
 plot([0,15],[0,15;1,1]'*b,':','linewidth',3,'color',[0.8,0.4,0.4]/2+0.5)

 r2(1)=stats(1); 
 p2=plot(gregmat,tomat85(:,335)-tomat85(:,235),'.','markersize',10,'color',[0.4,0.8,0.4])
  [b,~,~,~,stats]=regress((tomat85(:,335)-tomat85(:,235)),[gregmat;ones(size(tcr4mat))]')
 plot([0,20],[0,20;1,1]'*b,':','linewidth',3,'color',[0.4,0.8,0.4]/2+0.5)
 r2(2)=stats(1);


 
 p3=plot(tcrmat,tomat85(:,335)-tomat85(:,235),'.','markersize',10,'color',[0.4,0.4,0.8])
  [b,~,~,~,stats] =regress((tomat85(:,335)-tomat85(:,235)),[tcrmat;ones(size(tcr4mat))]')
 plot([0,20],[0,20;1,1]'*b,':','linewidth',3,'color',[0.4,0.4,0.8]/2+0.5)
 r2(3)=stats(1);


 p4=plot(abs(stmat(:,150)'),tomat85(:,335)-tomat85(:,235),'.','markersize',10,'color',[0.8,0.4,0.8])
    [b,~,~,~,stats]=regress((tomat85(:,335)-tomat85(:,235)),[abs(stmat(:,150)');ones(size(tcr4mat))]')
   plot([0,60],[0,60;1,1]'*b,':','linewidth',3,'color',[0.8,0.4,0.8]/2+0.5)
 r2(4)=stats(1);

   
legend([p1,p2,p3,p4],['T140 (R^2=' num2str(r2(1),2) ')'],['EffCS (R^2=' num2str(r2(2),2) ')'],['TCR (R^2=' num2str(r2(3),2) ')'],['A140 (R^2=' num2str(r2(4),2) ')'],'location','southeast')
  ylabel({'RCP8.5 Warming','2000-2100 (K)'})
  xlabel('(K)')
  xlim([0,30])
  ylim([0,8])
 
title('(c)')
  
subplot(3,2,4)
 p1=plot(tcr4mat,tomat26(:,335)-tomat26(:,235),'.','markersize',10,'color',[0.8,0.4,0.4])
 hold on
 [b,~,~,~,stats]=regress((tomat26(:,335)-tomat26(:,235)),[tcr4mat;ones(size(tcr4mat))]');
 
 plot([0,10],[0,10;1,1]'*b,':','linewidth',3,'color',[0.8,0.4,0.4]/2+0.5)

 r2(1)=stats(1); 
 p2=plot(gregmat,tomat26(:,335)-tomat26(:,235),'.','markersize',10,'color',[0.4,0.8,0.4])
  [b,~,~,~,stats]=regress((tomat26(:,335)-tomat26(:,235)),[gregmat;ones(size(tcr4mat))]')
 plot([0,20],[0,20;1,1]'*b,':','linewidth',3,'color',[0.4,0.8,0.4]/2+0.5)
 r2(2)=stats(1);


 
 p3=plot(tcrmat,tomat26(:,335)-tomat26(:,235),'.','markersize',10,'color',[0.4,0.4,0.8])
 hold on
  [b,bint,~,~,stats] =regress((tomat26(:,335)-tomat26(:,235)),[tcrmat;ones(size(tcr4mat))]')
  plot([0,5],[0,5;1,1]'*b,':','linewidth',3,'color',[0.4,0.4,0.8]/2+0.5)

 r2(3)=stats(1);


 p4=plot(abs(stmat(:,150)'),tomat26(:,335)-tomat26(:,235),'.','markersize',10,'color',[0.8,0.4,0.8])
    [b,~,~,~,stats]=regress((tomat26(:,335)-tomat26(:,235)),[abs(stmat(:,150)');ones(size(tcr4mat))]')
   plot([0,60],[0,60;1,1]'*b,':','linewidth',3,'color',[0.8,0.4,0.8]/2+0.5)
 r2(4)=stats(1);

   
legend([p1,p2,p3,p4],['T140 (R^2=' num2str(r2(1),2) ')'],['EffCS (R^2=' num2str(r2(2),2) ')'],['TCR (R^2=' num2str(r2(3),2) ')'],['A140 (R^2=' num2str(r2(4),2) ')'],'location','southeast')
  ylabel({'RCP2.6 Warming','2000-2100 (K)'})
  xlabel('(K)')
  xlim([0,30])
  ylim([0,3])
 
   title('(d)')
subplot(3,2,6)

mdlpstr=(mdlpst(:,:,end)-repmat(mean(mdlpst(:,:,end)',1),400,1)')'./repmat(std(mdlpst(:,:,end)'),400,1);

bg=regress(gregmat'/std(gregmat),mdlpstr(:,[8:11,13]));
bg(:,2)=regress(stmat(:,150)/std(stmat(:,150)),mdlpstr(:,[8:11,13]));

bg(:,3)=regress(tcrmat'/std(tcrmat),mdlpstr(:,[8:11,13]));        ;
bg(:,4)=regress(tcr4mat'/std(tcr4mat),mdlpstr(:,[8:11,13]));       ; ;
bg(:,5)=regress(tomat85(:,336)/std(tomat85(:,336)),mdlpstr(:,[8:11,13]));
bg(:,6)=regress(tomat26(:,336)/std(tomat26(:,336)),mdlpstr(:,[8:11,13]));



b=bar(bg)
set(gca,'xticklabel',{'q_{slow}','q_{fast}','d_{slow}','d_{fast}','f_a'})
set(b(1),'FaceColor',[0.5,0.8,0.5],'edgecolor','none')
set(b(2),'FaceColor',[0.1,0.5,0.1],'edgecolor','none')
set(b(3),'FaceColor',[0.7,0.5,0.7],'edgecolor','none')
set(b(4),'FaceColor',[0.4,0.1,0.4],'edgecolor','none')


set(b(5),'FaceColor',[0.7,0.4,0.4],'edgecolor','none')
set(b(6),'FaceColor',[0.4,0.4,0.7],'edgecolor','none')

l=legend(b,'EffCS','A140','TCR','T140','RCP8.5 2100','RCP2.6 2100','location','east')
set(l,'position', [0.7969    0.0802    0.1915    0.1240])

xlim([0,8])
ylabel('Normalized regression coefficient')
xlabel('Model Parameter')
 
title('(f)')


subplot(3,2,5)
bins=[0:0.5:20];

ao=hist(gregmat,bins)
p1=plot(bins,cumsum(ao)/sum(ao),'-','linewidth',2,'color',[0.5,0.8,0.5])
bins=[0:0.1:20];
hold on


ao=hist(stmat(:,150),bins)
p2=plot(bins,cumsum(ao)/sum(ao),'-','linewidth',2,'color',[0.1,0.5,0.1])

ao=hist(tcrmat,bins)
p3=plot(bins,cumsum(ao)/sum(ao),'-','linewidth',2,'color',[0.7,0.5,0.7])

ao=hist(tcr4mat,bins)
p4=plot(bins,cumsum(ao)/sum(ao),'-','linewidth',2,'color',[0.4,0.1,0.4])

l=legend([p1,p2,p3,p4],'EffCS','A140','TCR','T140','location','east')
title('(e)')

ax=gca;

xlim([0,20])
set(gca,'ytick',[0.1,0.25,0.5,0.75,0.9])
grid on

xlabel('(K)')
ylabel('Likelihood')

   set(gcf, 'PaperPosition', [0 0 8 8]);
set(gcf, 'PaperSize', [8 8]); 
print(gcf,'-dpdf','-painters',['corr.pdf']);


  
