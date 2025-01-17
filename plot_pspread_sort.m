figure(1)
clf

consttx={'EffCS','TCR','T140','A140'}
prec={'%0.1f','%0.2f','%0.1f','%0.1f'}
%is3=find(abs(gregmat./2-3)<0.1)
for j=1:4
  switch j
    case 1
      [a,b]=sort(abs(gregmat./2))
case(2)
[a,b]=sort(abs(tcrmat))
case(3)
  [a,b]=sort(abs(tcr4mat))
case(4)
  [a b]=sort((abs(stmat(:,150)')))
  end
  
is3=b(181:220);
%is4=b(201:400);
subplot(4,5,1+5*(j-1))
plot(tim21,tomat85(:,:)','color',[0.8,.8,0.8])
hold on
plot(tim21,tomat85(is3,:)','color','k')
%plot(tim21,tomat85(is4,:)','color',[0.9,0.1,0.1])


pr=prctile(tomat85(:,386)',[1,25,50,75,99])
rectangle('Position',[1960,pr(2),10,pr(4)-pr(2)],'edgecolor',[.8,.8,.8],'facecolor',[.8,.8,.8])
plot(1965*[1,1],[pr(1),pr(5)],'color',[.8,.8,.8])


pr=prctile(tomat85(is3,386)',[1,25,50,75,99])
rectangle('Position',[2000,pr(2),10,pr(4)-pr(2)],'edgecolor',[.0,.0,.0],'facecolor',[.0,.0,.0])
plot(2005*[1,1],[pr(1),pr(5)],'k')
text(1960,9,[consttx{j} '=' num2str(a(180),prec{j}) '-' num2str(a(220),prec{j}) ])
ylabel({'(K)'})
xlabel('year')
xlim([1950,2150])
%title('RCP8.5')
title(['(' char(96+1+5*(j-1)) ') RCP8.5'],'interpreter','none')

subplot(4,5,2+5*(j-1))
plot(tim3000,tomat26(:,:)','color',[0.8,0.8,0.8])
hold on
plot(tim3000,tomat26(is3,:)','color','k')
xlim([1950,2150])
%title('RCP2.6')
title(['(' char(96+2+5*(j-1)) ') RCP2.6'],'interpreter','none')

xlabel('year')


pr=prctile(tomat26(:,386)',[1,25,50,75,99])
rectangle('Position',[1960,pr(2),10,pr(4)-pr(2)],'edgecolor',[.8,.8,.8],'facecolor',[.8,.8,.8])
plot(1965*[1,1],[pr(1),pr(5)],'color',[.8,.8,.8])


pr=prctile(tomat26(is3,386)',[1,25,50,75,99])
rectangle('Position',[2000,pr(2),10,pr(4)-pr(2)],'edgecolor',[.0,.0,.0],'facecolor',[.0,.0,.0])
plot(2005*[1,1],[pr(1),pr(5)],'k')

ylabel('(K)')
text(1960,3.5,[consttx{j} '=' num2str(a(180),prec{j}) '-' num2str(a(220),prec{j}) ])

subplot(4,5,3+5*(j-1))
plot(1:150,stcrmat(:,:)','color',[0.8,0.8,0.8])
hold on
plot(1:150,stcrmat(is3,:)','color','k')
%title('1pctCO2')
title(['(' char(96+3+5*(j-1)) ') 1pctCO2'],'interpreter','none')

xlabel('year')

pr=prctile(stcrmat(:,150)',[1,25,50,75,99])
rectangle('Position',[10,pr(2),10,pr(4)-pr(2)],'edgecolor',[.8,.8,.8],'facecolor',[.8,.8,.8])
plot(15*[1,1],[pr(1),pr(5)],'color',[.8,.8,.8])


pr=prctile(stcrmat(is3,150)',[1,25,50,75,99])
rectangle('Position',[30,pr(2),10,pr(4)-pr(2)],'edgecolor',[.0,.0,.0],'facecolor',[.0,.0,.0])
plot(35*[1,1],[pr(1),pr(5)],'k')
text(10,7,[consttx{j} '=' num2str(a(180),prec{j}) '-' num2str(a(220),prec{j}) ])

subplot(4,5,4+5*(j-1))
for i=1:40
  b2=regress(stmat(b(180+i),:)',[srmat(b(180+i),:)',ones(size(srmat,2),1)]);
  plot([0,150],[b2(2),b2(2)],'r')
  hold on
end

plot(1:150,stmat(:,:)','color',[0.8,0.8,0.8])
hold on
plot(1:150,stmat(is3,:)','color','k')
title(['(' char(96+4+5*(j-1)) ') abrupt4xCO2'],'interpreter','none')

%title('abrupt4xCO2')
xlabel('year')

pr=prctile(stmat(:,150)',[1,25,50,75,99])
rectangle('Position',[10,pr(2),10,pr(4)-pr(2)],'edgecolor',[.8,.8,.8],'facecolor',[.8,.8,.8])
plot(15*[1,1],[pr(1),pr(5)],'color',[.8,.8,.8])


pr=prctile(stmat(is3,150)',[1,25,50,75,99])
rectangle('Position',[30,pr(2),10,pr(4)-pr(2)],'edgecolor',[.0,.0,.0],'facecolor',[.0,.0,.0])
plot(35*[1,1],[pr(1),pr(5)],'k')
text(10,10,[consttx{j} '=' num2str(a(180),prec{j}) '-' num2str(a(220),prec{j}) ])


subplot(4,5,5+5*(j-1))

plot(stmat(:,:)',srmat(:,:)','color',[0.8,0.8,0.8])
hold on
plot(stmat(is3,:)',srmat(is3,:)','color',[0,0,0])
%title('abrupt4xCO2')
title(['(' char(96+5+5*(j-1)) ') abrupt4xCO2 (T/N)'],'interpreter','none')

for i=1:40
  b2=regress(stmat(b(180+i),:)',[srmat(b(180+i),:)',ones(size(srmat,2),1)]);
  plot([0,b2(2)],-[b2(2)/b2(1),0],'color',[1,0,0,0.5])
  hold on
end
ylim([0,8])
xlim([0,8])
text(2,7,[consttx{j} '=' num2str(a(180),prec{j}) '-' num2str(a(220),prec{j}) ])
xlabel('K')
ylabel('Wm^{-2}')
t2=text(3,5,'EffCS fit')
set(t2,'color','r')

end

   set(gcf, 'PaperPosition', [0 0 10 8]);
set(gcf, 'PaperSize', [10 8]); 
print(gcf,'-dpdf','-painters',['pspread.pdf']);

