figure(22)
clf
b2050=ceopt(:,286,2,1)'-ceopt(:,256,2,1)';

for kk=1:4
  subplot(2,2,kk)
  
  plot_tcnst
  title(['(' char(96+kk) ') ' prnm{kk} ]) 
legend([pl],'1.5^oC stabilization','2^oC stabilization','location','northeast')

end


   set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['tcnst_all.pdf']);
