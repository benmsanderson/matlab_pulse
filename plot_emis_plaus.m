
figure(4)
clf


for i=1:4
  subplot(2,2,i)
  for j=1:400
    tmp=tim3000(min(find(eopt(j,:,1,1)<0)));
     if numel(tmp)==1
       tcrs(j)=tmp;
     else
       tcrs(j)=NaN;
       end
  end
  
    
  isplaus=find(and(tcrs>2060,tcrs<2065));

 areabar(tim3000(1:286),eopt(isplaus,1:286,1,i)',10,[0.3,0.3,0.3])

  hold on
  
areabar(tim3000(1:end),eopt(isplaus,1:end,1,i)',10,[0.3,0.8,0.3])
xlim([1950,2250])



areabar(tim3000(1:end),eopt(isplaus,1:end,2,i)',10,[0.5,0.5,0.8])
grid on
xlabel('Year')
ylabel('Emissions (GtC)')
ylim([-10,20])
title(['(' char(96+i) ') ' prnm{i} ]) 

end

   
   set(gcf, 'PaperPosition', [0 0 9 8]);
set(gcf, 'PaperSize', [9 8]); 
print(gcf,'-dpdf','-painters',['budget_e.pdf']);

