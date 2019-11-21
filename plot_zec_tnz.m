figure(45)
clf
psn=[0.15,0.55,0.7,0.35];

cols=[0,1,0;0,0,1];
subplot(2,1,1)
for k=1:numel(targ)
  plot(tnz,(ceopt(:,336,k,1)-ceopt(:,296,k,1)),'o','markerfacecolor',cols(k,:)/10+.9,'markeredgecolor',cols(k,:)/5+.8)
%  plot(tnz,min(eopt(:,286:307,k,1),[],2),'o','markerfacecolor',cols(k,:)/10+.9,'markeredgecolor',cols(k,:)/5+.8)
  
  hold on
end
stop
    ax0 = gca;
    set(ax0,'box','off','color','none')
    bx0 = axes('Position',get(ax0,'Position'),'box','on','xtick',[],'ytick',[]);
    axes(ax0)
    linkaxes([ax0 bx0])
xlim([2030,2060])

r1=rectangle('Position',[2030,-14.3/44*12,2060,6.2/44*12])
set(r1,'FaceColor',[0.5,.5,.5,0.5],'edgecolor','none') 
hold on
t=text(2032,-5,{'IPCC SR1.5','1.5(lowOS)','2100 emissions'})
set(t,'color',[0.5,.5,.5,0.5],'VerticalAlignment','top')
hold on
    
%for i=[-600:200:600]
%  plot([0,500],[0,-500]-i,'color',[0.8,0.5,.5])
%  hold on
%  t=text(230-i/3,-230-2*i/3+40,[num2str(-i) 'GtC'])
%  set(t,'color',[0.8,0.5,.5],'rotation',-16)
%end


%hold on
%plot([0,500],[0,-500]+200,'color',[0.8,0.5,.5])
%plot([0,500],[0,-500]+400,'color',[0.8,0.5,.5])
%plot([0,500],[0,-500]+600,'color',[0.8,0.5,.5])
%plot([0,500],[0,-500]-200,'color',[0.8,0.5,.5])
%plot([0,500],[0,-500]-400,'color',[0.8,0.5,.5])
%ps=plot([0,500],[0,-500]-600,'color',[0.8,0.5,.5])


%s=scatter(ceopt(:,286,k,1)'-ceopt(:,256,k,1)',(ceopt(:,336,k,1)-ceopt(:,286,k,1)),20,topt(:,286,k,1),'MarkerFaceColor','flat');





for k=1:numel(targ)

hold on
bbins=linspace(2030,2060,100);
for i=1:numel(bbins)
  cnds=find(abs(tnz-bbins(i))<5);
  brng(i,:)=prctile((ceopt(cnds,336,k,1)'-ceopt(cnds,307,k,1)')/30,[5,50,95]);    
end

for j=1:3
  brngs(:,j)=smooth(brng(:,j),80,'lowess');
end
%[p1,a]=areabar(tim,tmat,bnd,col,fillbar,fillbarls,alpa,hatch,ng,dots)
pl(k)=areabar(bbins,brngs,0,cols(k,:)/3+.2,1,'-',0.2,0,6,1)
end



xlabel('2020-2050 net carbon emitted (GtC)')
ylabel({'2071-2100 mean emissions rate for','temperature stabilization (GtC/yr)'})

cemis_26=cumsum(emis_26);
cemis_85=cumsum(emis_85);

%plot([cemis_26(286)'-cemis_26(256)']*[1,1],[-2000,2000],'k:','linewidth',2)
%t=text([cemis_26(286)'-cemis_26(256)']-10,-20,'RCP2.6 (2050)')
%set(t,'Rotation',90)
%plot([cemis_85(286)'-cemis_85(256)']*[1,1],[-2000,2000],'k:','linewidth',2)
%t=text([cemis_85(286)'-cemis_85(256)']-10,-20,'RCP8.5 (2050)')
%set(t,'Rotation',90)
%cb=colorbar
%set(get(cb,'Label'),'String',{'Temperature above pre-industrial in 2050 (K)'})
%xlim([20,500])
ylim([-25,10])
caxis([1.5,2])

grid on

legend([pl],'1.5^oC stabilization','2^oC stabilization','location','southwest')

%set(gca,'position',psn)
title('(a) Near-term budget implications for late century carbon removal')
stop

subplot(2,1,2)
kk=1;
plot_tcnst
set(gca,'position',[0.15,0.1,0.7,0.35])
set(ax1,'position',[0.15,0.1,0.7,0.35])

title('(b) Mid-century warming constraints on late century carbon removal')
kk
   set(gcf, 'PaperPosition', [0 0 6 11]);
set(gcf, 'PaperSize', [6 11]); 
print(gcf,'-dpdf','-painters',['zec_budget.pdf']);



