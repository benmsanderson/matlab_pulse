
figure(3)
clf
for i=1:4
  subplot(2,2,i)
  areabar(tim3000(1:286),topt(:,1:286,1,i)',10,[0.3,0.3,0.3])

areabar(tim3000(287:end),topt(:,287:end,1,i)',10,[0.3,0.8,0.3])
xlim([1950,2250])
hold on
areabar(tim3000(287:end),topt(:,287:end,2,i)',10,[0.5,0.5,0.8])
grid on
xlabel('Year')
ylabel('Temperature (K)')
title(['(' char(96+i) ') ' prnm{i} ]) 

end

   
   set(gcf, 'PaperPosition', [0 0 9 8]);
set(gcf, 'PaperSize', [9 8]); 
print(gcf,'-dpdf','-painters',['budget_ts.pdf']);
