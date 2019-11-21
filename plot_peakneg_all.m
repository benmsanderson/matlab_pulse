figure(45)
clf
cols=[0,1,0;0,0,1];
for kk=1:4
subplot(2,2,kk)

for k=1:numel(targ)
  plot(ceopt(:,286,k,kk)'-ceopt(:,256,k,kk)',mean(eopt(:,306:336,k,kk),2),'o','markerfacecolor',cols(k,:)/10+.9,'markeredgecolor',cols(k,:)/5+.8)
  hold on
end

    ax0 = gca;
    set(ax0,'box','off','color','none')
    bx0 = axes('Position',get(ax0,'Position'),'box','on','xtick',[],'ytick',[]);
    axes(ax0)
    linkaxes([ax0 bx0])





for k=1:numel(targ)

hold on
bbins=linspace(min(ceopt(:,286,k,kk)'-ceopt(:,256,k,kk)'),max(ceopt(:,286,k,kk)'-ceopt(:,256,k,kk)'),100);
for i=1:numel(bbins)
  cnds=find(abs(ceopt(:,286,k,kk)'-ceopt(:,256,k,kk)'-bbins(i))<50);
  brng(i,:)=prctile(mean(eopt(cnds,306:336,k,kk),2),[10,50,90]);    
end

for j=1:3
  brngs(:,j)=smooth(brng(:,j),80,'lowess');
end
%[p1,a]=areabar(tim,tmat,bnd,col,fillbar,fillbarls,alpa,hatch,ng,dots)
pl(k)=areabar(bbins,brngs,0,cols(k,:)/3+.2,1,'-',0.2,0,6,1)
end



xlabel('2020-2050 net carbon emitted (GtC)')
ylabel({'2070-2100 mean emissions rate for','temperature stabilization (GtC/yr)'})

cemis_26=cumsum(emis_26);
cemis_85=cumsum(emis_85);

plot([cemis_26(286)'-cemis_26(256)']*[1,1],[-2000,2000],'k:','linewidth',2)
t=text([cemis_26(286)'-cemis_26(256)']-10,-700,'RCP2.6 (2050)')
set(t,'Rotation',90)
plot([cemis_85(286)'-cemis_85(256)']*[1,1],[-2000,2000],'k:','linewidth',2)
t=text([cemis_85(286)'-cemis_85(256)']-10,-700,'RCP8.5 (2050)')
set(t,'Rotation',90)
%cb=colorbar
%set(get(cb,'Label'),'String',{'Temperature above pre-industrial in 2050 (K)'})
xlim([20,500])


grid on

ax1 = gca; % current axes

ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
%ylabel({'2050-2100 rate of net','carbon removal for stabilization (GtC/yr)'})
ylim([-1000,500]/50)
xlim([20,500])
set(gca,'xtick',timmp)
lbs=cellfun(@(x) ['\textsf{' num2str(x) '}'],num2cell(timscl),'UniformOutput',0);



lbs(11:14)={''};
lbs(16)={''};
lbs(end)={'$\infty\to$'};

legend([pl],'1.5^oC stabilization','2^oC stabilization','location','southwest')

set(gca,'xticklabel',lbs)
set(gca,'TickLabelInterpreter','latex')
xlabel({'Change in 2050 emissions from 2020 (% 2020 emissions)'})
set(gca,'ytick',[])
title(['(' char(96+kk) ') ' prnm{kk} ]) 

end



   set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['peakneg_all.pdf']);
