
figure(4)
clf
for i=1:4
  subplot(2,2,i)
  isplaus=find(min(eopt(:,:,1,i),[],2)>-10);

p1=areabar(tim3000(1:276),eopt(:,1:276,1,i)',10,[0.3,0.3,0.3])

  hold on
  
p2=areabar(tim3000(277:end),eopt(:,277:end,1,i)',10,[0.3,0.8,0.3])
xlim([1950,2250])
hold on
  isplaus=find(min(eopt(:,:,2,i),[],2)>-10);

areabar(tim3000(277:end),eopt(:,277:end,2,i)',10,[0.5,0.5,0.8])
grid on
xlabel('Year')
ylabel('Emissions (GtC)')
ylim([-15,20])
title(['(' char(96+i) ') ' prnm{i} ]) 
legend([p1,p2],'1.5 degree pathway','2.0 degree pathway')
end

   
   set(gcf, 'PaperPosition', [0 0 9 8]);
set(gcf, 'PaperSize', [9 8]); 
print(gcf,'-dpdf','-painters',['budget_e.pdf']);

