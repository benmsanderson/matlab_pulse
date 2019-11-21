  figure(1)
  clf
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
  
   
   set(gcf, 'PaperPosition', [0 0 5 4]);
set(gcf, 'PaperSize', [5 4]); 
print(gcf,'-dpdf','-painters',['ts.pdf']);


  
  
