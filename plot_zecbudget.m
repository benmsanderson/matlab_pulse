figure(45)
clf%
psn=[0.15,0.55,0.7,0.35];

cols=[0,1,0;0,0,1];
subplot(2,1,1)
for k=1:numel(targ)
  plot(ceopt(:,276,k,1)'-ceopt(:,256,k,1)',(ceopt(:,336,k,1)-ceopt(:,307,k,1))/30,'o','markerfacecolor',cols(k,:)/10+.9,'markeredgecolor',cols(k,:)/5+.8)
  hold on
end

    ax0 = gca;
    set(ax0,'box','off','color','none')
    bx0 = axes('Position',get(ax0,'Position'),'box','on','xtick',[],'ytick',[]);
    axes(ax0)
    linkaxes([ax0 bx0])


r1=rectangle('Position',[0,-14.3/44*12,500,6.2/44*12])
set(r1,'FaceColor',[0.5,.5,.5,0.5],'edgecolor','none') 
hold on
t=text(120,-5,{'IPCC SR1.5','1.5(lowOS)','2100 emissions'})
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


%s=scatter(ceopt(:,276,k,1)'-ceopt(:,256,k,1)',(ceopt(:,336,k,1)-ceopt(:,276,k,1)),20,topt(:,276,k,1),'MarkerFaceColor','flat');





for k=1:numel(targ)

hold on
bbins=linspace(min(ceopt(:,276,k,1)'-ceopt(:,256,k,1)'),max(ceopt(:,276,k,1)'-ceopt(:,256,k,1)'),100);
for i=1:numel(bbins)
  cnds=find(abs(ceopt(:,276,k,1)'-ceopt(:,256,k,1)'-bbins(i))<20);
  brng(i,:)=prctile((ceopt(cnds,336,k,1)'-ceopt(cnds,307,k,1)')/30,[10,50,90]);    
end

for j=1:3
  brngs(:,j)=smooth(brng(:,j),80,'lowess');
end
%[p1,a]=areabar(tim,tmat,bnd,col,fillbar,fillbarls,alpa,hatch,ng,dots)
pl(k)=areabar(bbins,brngs,0,cols(k,:)/3+.2,1,'-',0.2,0,6,1)
end



xlabel('2020-2040 net carbon emitted (GtC)')
ylabel({'2071-2100 mean emissions rate for','temperature stabilization (GtC/yr)'})

cemis_26=cumsum(emis_26);
cemis_85=cumsum(emis_85);

%plot([cemis_26(276)'-cemis_26(256)']*[1,1],[-2000,2000],'k:','linewidth',2)
%t=text([cemis_26(276)'-cemis_26(256)']-10,-20,'RCP2.6 (2040)')
%set(t,'Rotation',90)
%plot([cemis_85(276)'-cemis_85(256)']*[1,1],[-2000,2000],'k:','linewidth',2)
%t=text([cemis_85(276)'-cemis_85(256)']-10,-20,'RCP8.5 (2040)')
%set(t,'Rotation',90)
%cb=colorbar
%set(get(cb,'Label'),'String',{'Temperature above pre-industrial in 2040 (K)'})
xlim([100,200])
ylim([-15,10])
caxis([1.5,2])



b2050=ceopt(:,276,2,1)'-ceopt(:,256,2,1)';
r2050=(eopt(:,276,2,1)-eopt(:,256,2,1))./eopt(:,256,2,1)*100;
tz=(2020+20*-100./(r2050))
tz(tz>2060)=NaN;
tz(tz<2040)=NaN;

b=regress(b2050',[r2050,ones(400,1)]);


clear timmp
timscl=[-100:20:0];
timmp=[timscl;ones(size(timscl))]'*b;

grid on

ax1 = gca; % current axes
set(ax1,'position',psn)
set(ax0,'position',psn)
set(bx0,'position',psn)

ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
%ylabel({'2050-2100 mean rate of net','carbon emissions for stabilization (GtC/yr)'})
ylim([-1000,550]/50)
xlim([90,200])
set(gca,'xtick',timmp)
lbs=cellfun(@(x) [num2str(x)],num2cell(timscl),'UniformOutput',0);
set(gca,'xticklabel',lbs)



legend([pl],'1.5^oC stabilization','2^oC stabilization','location','southwest')

set(gca,'xticklabel',lbs)
ax2.XColor = [0.6,0.6,0.6];
ax2.YColor = [0.6,0.6,0.6];

%xlabel({'Change in 2040 emissions from 2020 (%2020 emissions)'})
xlabel({'2040 reduction in emissions relative to 2020 (%)'})

set(gca,'ytick',[])
%yt=get(gca,'yticklabel')
%yts=yt;%cellfun(@(x) ['\textsf{' x '}'],yt,'UniformOutput',0);
%set(gca,'yticklabel',yts)
set(gca,'position',psn)
title('(a) Near-term budget implications for late century carbon removal')


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



