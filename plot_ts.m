  figure(1)
  clf
  subplot(4,2,[1,5])
  % plot(tim21,tomat85','color',[0.7,0.4,0.4])
  p85=areabar(tim21,tomat85',10,[0.7,0.4,0.4],0,'-',0.2,3,3);
 
  hold on
     p85ml=areabar(tim21,tomat85ml',10,[0.7,0.4,0.4],1,'-.',0.7);

    p85=areabar(tim21,tomat85',10,[0.7,0.4,0.4],0,'-',0.7,3,3);

   p85cf=areabar(tim21,tomat85cf',10,[0.7,0.4,0.4],1,':');
   p85nl=areabar(tim21,tomat85nl',10,[0.7,0.4,0.4],0,'--');


   hold on
   %   plot(tim3000,tomat26ne','color',[0.4,0.4,0.7])
   %  p26n=areabar(tim3000,tomat26ne',5,[0.4,0.7,0.4],0)
   %   p26ncf=areabar(tim3000,tomat26necf',5,[0.4,0.7,0.4])
          %     p26nnl=areabar(tim3000,tomat26nenl',5,[0.4,0.7,0.4],0,'--')

   %   plot(tim21,tomat26','color',[0.4,0.7,0.4])

         p26cf=areabar(tim3000,tomat26ml',10,[0.4,0.4,0.7],1,'-.',0.7);

      p26=areabar(tim3000,tomat26',10,[0.4,0.4,0.7],1,'-',0.7,3,3);
      p26cf=areabar(tim3000,tomat26cf',10,[0.4,0.4,0.7],0,':');
      [p26nl,a]=areabar(tim3000,tomat26nl',10,[0.4,0.4,0.7],0,'--');
      
%      p26ne=areabar(tim3000,tomat26ne',10,[0.4,0.7,0.4],0,'-');
 %   p26necf=areabar(tim3000,tomat26necf',10,[0.4,0.7,0.4],0,':');
%    p26nenl=areabar(tim3000,tomat26nenl',10,[0.4,0.7,0.4],0,'--');
%    p26neml=areabar(tim3000,tomat26neml',10,[0.4,0.7,0.4],0,'-.',0.7);

   plot(tim_had,gm_had,'k','linewidth',2);
   xlim([1970,2300]);
   ylim([0,9]);
   xlabel('Year');
   ylabel({'Global mean temperature','above 1850 (T_g, K)'});
   title('(a)');
  
   ax1=gca;
   subplot(4,2,2)
     p85=areabar(ce,ce_int85_nenl',10,[0.7,0.4,0.4],0,'--',0.7,3,15);
     hold on
          p85=areabar(ce,ce_int85_nenl',10,[0.7,0.4,0.4],0,'--',0.7,3,15);

   p26=areabar(ce,ce_int26_upnl',10,[0.4,0.4,0.7],1,'--',0.4,3,15);
   areabar(ce,ce_int26_dnnl',10,[0.4,0.4,0.7],1,'--',0.4,3,15);
 %  p26ne=areabar(ce,ce_int26_nenl',10,[0.4,0.7,0.4],1,'--',0.4,3,15);

  po=plot(ce,ce_obs','k','linewidth',2);
   ax2=gca;
   axp=get(gca,'position')

   ylim([0,4]);
   xlim([0,2000])
   xlabel({'Cumulative emissions (GtC)'})   ;
   ylabel({'T_g (K)'});
   title('(b) C,T constraints');
   grid on

   subplot(4,2,4)
   p85=areabar(ce,ce_int85_ne',10,[0.7,0.4,0.4],1,'-',0.4,1,30);
   hold on
      p85=areabar(ce,ce_int85_ne',10,[0.7,0.4,0.4],1,'-',0.4,1,30);

   p26=areabar(ce,ce_int26_up',10,[0.4,0.4,0.7],1,'-',0.4,1,30);
   areabar(ce,ce_int26_dn',10,[0.4,0.4,0.7],1,'-',0.4,1,30);
 %  p26ne=areabar(ce,ce_int26_ne',10,[0.4,0.7,0.4],1,'-',0.4,1,30);

  po=plot(ce,ce_obs','k','linewidth',2);
   ax2=gca;
   axp=get(gca,'position')
   xlim([0,2000])

   ylim([0,4]);
   xlabel({'Cumulative emissions (GtC)'})   ;
      ylabel({'T_g (K)'});

   title('(c) C,T,heat constraints');
   grid on


   subplot(4,2,8)
     p85=areabar(ce,ce_int85_neml',10,[0.7,0.4,0.4],1,'-.',0.7);
     hold on
          p85=areabar(ce,ce_int85_neml',10,[0.7,0.4,0.4],1,'-.',0.7);

   p26=areabar(ce,ce_int26_upml',10,[0.4,0.4,0.7],1,'-.',0.7);
   areabar(ce,ce_int26_dnml',10,[0.4,0.4,0.7],1,'-.',0.7);
 %  p26ne=areabar(ce,ce_int26_neml',10,[0.4,0.7,0.4],1,'-.',0.7);

  po=plot(ce,ce_obs','k','linewidth',2);
   ax2=gca;
   axp=get(gca,'position')
   xlim([0,2000])

   ylim([0,4]);
         ylabel({'T_g (K)'});

   xlabel({'Cumulative emissions (GtC)'})   ;
   title('(e) C,T,RWF constraints');
   grid on



   subplot(4,2,6)
   
     p85=areabar(ce,ce_int85_necf',10,[0.7,0.4,0.4],1,':',0.4,2,30);
     hold on
     p85=areabar(ce,ce_int85_necf',10,[0.7,0.4,0.4],1,':',0.4,2,30);

     
   p26=areabar(ce,ce_int26_upcf',10,[0.4,0.4,0.7],1,':',0.4,2,30);
   areabar(ce,ce_int26_dncf',10,[0.4,0.4,0.7],1,':',0.4,2,30);
%   p26ne=areabar(ce,ce_int26_necf',10,[0.4,0.7,0.4],1,':',0.4,2,30);

  po=plot(ce,ce_obs','k','linewidth',2);
   ax2=gca;
   axp=get(gca,'position')
   xlim([0,2000])

   ylim([0,4]);
   xlabel({'Cumulative emissions (GtC)'})   ;
         ylabel({'T_g (K)'});

   title('(d)   C,T,Paleo constraints');
   grid on


   subplot(4,2,7)

   areabar([100:200],repmat([2.6;3;3.4],1,101)'+5,10,[0.7,.4,.4],1,'--',0.4,3,6)
   
   hold on
   areabar([100:200],repmat([2.6;3;3.4],1,101)'+5,10,[0.7,.4,.4],1,'--',0.4,3,6)

   areabar([250:350],repmat([2.6;3;3.4],1,101)'+5,10,[0.7,.4,.4],1,'-',0.4,1,50)
   areabar([550:650],repmat([2.6;3;3.4],1,101)'+5,10,[0.7,.4,.4],1,'-.',0.7)
   areabar([400:500],repmat([2.6;3;3.4],1,101)'+5,10,[0.7,.4,.4],1,':',0.4,2,50)

 %  areabar([100:200],repmat([2.6;3;3.4],1,101)'+4,10,[0.4,.7,.4],1,'--',0.4,3,6)
 %  areabar([250:350],repmat([2.6;3;3.4],1,101)'+4,10,[0.4,.7,.4],1,'-',0.4,1,50)
 %  areabar([400:500],repmat([2.6;3;3.4],1,101)'+4,10,[0.4,.7,.4],1,'-.',0.7)
 %  areabar([550:650],repmat([2.6;3;3.4],1,101)'+4,10,[0.4,.7,.4],1,':',0.4,2,50)

   areabar([100:200],repmat([2.6;3;3.4],1,101)'+3,10,[0.4,.4,.7],1,'--',0.4,3,6)
   areabar([250:350],repmat([2.6;3;3.4],1,101)'+3,10,[0.4,.4,.7],1,'-',0.4,1,50)
   areabar([550:650],repmat([2.6;3;3.4],1,101)'+3,10,[0.4,.4,.7],1,'-.',0.7)
   areabar([400:500],repmat([2.6;3;3.4],1,101)'+3,10,[0.4,.4,.7],1,':',0.4,2,50)




%   text(50,9,'Prior','FontWeight','bold','HorizontalAlignment','right')
   text(50,5,'Constraint','FontWeight','bold','HorizontalAlignment','right','VerticalAlignment','top')

   text(700,8,'RCP8.5','fontweight','bold')
 %  text(700,7,'RCP2.6nn','fontweight','bold')
   text(700,6,'RCP2.6','fontweight','bold')
%   text(100,9,'Flat')
   text(100,5,{'C,T'},'VerticalAlignment','top')
 %  text(250,9,'Flat')
   text(250,5,{'C,T','heat'},'VerticalAlignment','top')
 %  text(550,9,'Paleo')
   text(400,5,{'C,T','Paleo'},'VerticalAlignment','top')
 %  text(400,9,'Flat')
   text(550,5,{'C,T','RWF'},'VerticalAlignment','top')



   axis([-250,1050,0,10])
   set(gca,'XTick',[])
   set(gca,'YTick',[]) 
   
   set(gca,'position',[0.02,0.02,0.45,0.25])

   
   set(gcf, 'PaperPosition', [0 0 9 8]);
set(gcf, 'PaperSize', [9 8]); 
print(gcf,'-dpdf','-painters',['ce.pdf']);


  
  
