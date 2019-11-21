
bdg=timmp;
clear ah
k=1
cols=[0,1,0;0,0,1];

b2050=ceopt(:,276,2,kk)'-ceopt(:,256,2,kk)';
r2050=(eopt(:,276,2,kk)-eopt(:,256,2,kk))./eopt(:,256,2,kk)*100;

for i=1:numel(bdg)
  [duf]=find(and(b2050>bdg(i)-15,b2050<(bdg(i)+15)));
  ah(:,i)=prctile(mean(topt(duf,276:296,k,kk),2),[5,25,50,75,95]);
end

r1=rectangle('Position',[1.3,-14.3/44*12,1,6.2/44*12])
set(r1,'FaceColor',[0.5,.5,.5,0.5],'edgecolor','none') 
hold on
t=text(1.4,-5,{'IPCC SR1.5','1.5(lowOS)','emissions'})
set(t,'color',[0.5,.5,.5,0.5],'VerticalAlignment','top')
r=rectangle('Position',[1.35,-29,0.6,17])
set(r,'FaceColor',[0.6,.4,.4,0.1],'edgecolor','none') 
hold on
for k=1:numel(targ)
plot(mean(topt(:,276:296,k,kk),2),(ceopt(:,336,k,kk)'-ceopt(:,307,k,kk)')/30,'o','markerfacecolor',cols(k,:)/10+.9,'markeredgecolor',cols(k,:)/5+.8);
hold on
end



hold on
for  k=1:numel(targ)
bbins=linspace(min(mean(topt(:,276:296,k,kk)',1)),max(mean(topt(:,276:296,k,kk)',1)),100);
	       clear brng
for i=1:numel(bbins)
  cnds=find(abs(mean(topt(:,276:296,k,kk)',1)-bbins(i))<.1);
  brng(i,:)=prctile((ceopt(cnds,336,k,kk)'-ceopt(cnds,307,k,kk)')/30,[10,50,90]);    
end

for j=1:3
  brngs(:,j)=smooth(brng(:,j),80,'lowess');
end
%[p1,a]=areabar(tim,tmat,bnd,col,fillbar,fillbarls,alpa,hatch,ng,dots)
pl(k)=areabar(bbins,brngs,0,cols(k,:)/3+.2,1,'-',0.2,0,6,1)
end



xlabel('Climatological warming above pre-industrial in 2040-2060 (K)')
ylabel({'2071-2100 mean rate of net','carbon emissions for stabilization (GtC/yr)'})

b2050=(ceopt(:,276,k,kk)'-ceopt(:,256,k,kk)');
grid on
tt=text(1.4,-15,{'2020-2040 budget (2040 % reduction)'},'fontweight','bold','color',[0.6,0.4,0.4],'VerticalAlignment','bottom')


for i=1:numel(timscl)
  plot(ah([1,5],i),-2*i*[1,1]-16.,'-','color',[0.6,0.4,0.4])
  
  hold on
  plot(ah([2,4],i),-2*i*[1,1]-16.,'-','color',[0.6,0.4,0.4],'linewidth',2)
    plot(ah([3],i)*[1,1],-2*i-16.+[-.5,.5],'-','color',[0.6,0.4,0.4],'linewidth',2)
    t=text(ah([2],i),-2*i-16.,[num2str(floor(timmp(i)/5)*5,'%0.0f\n') 'GtC (' num2str(timscl(i)) ')'])
   set(t,'VerticalAlignment','bottom','Color',[0.6,0.4,0.4])
end

xlim([1.35,2])

ylim([-30,10])
legend([pl],'1.5^oC stabilization','2^oC stabilization','location','northeast')

ax1 = gca; % current axes

ax1_pos = ax1.Position; % position of first axes
%ax2 = axes('Position',ax1_pos,...
%    'XAxisLocation','top',...
%    'YAxisLocation','right',...
%    'Color','none');
%ylabel({'2050-2100 mean rate of net','carbon emissions for stabilization (GtC/yr)'})
%ylim([-1500,500]/50)
%xlim([20,500])
%set(ax2,'xtick',[])
%ax2.XColor = [0.6,0.6,0.6];
%ax2.YColor = [0.6,0.6,0.6];



