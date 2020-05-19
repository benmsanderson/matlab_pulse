
for i=1:numel(true85_cmip)
  is85(i)=~isnan(true85_cmip{i}(1));
  is26(i)=~isnan(true26_cmip{i}(1));
end

figure(1)
clf
usem=find(is85)
for i=1:numel(usem)
  subplot(8,5,i)
  p85=areabar(tim21,tomat85_cmip(:,:,usem(i))',.001,[0.7,0.4,0.4],5,':',0.7,0,3);
  hold on
  plot( true85_cmipyr{usem(i)},true85_cmip{usem(i)},'color',[0.7,0.4,0.4],'linewidth',1)
  
  hold on
  if is26(usem(i))
      p26=areabar(tim3000,tomat26_cmip(:,:,usem(i))',.001,[0.4,0.4,0.7],1,':',0.7,0,3);

  plot( true85_cmipyr{usem(i)},true26_cmip{usem(i)},'color',[0.4,0.4,0.7],'linewidth',1)
  end
  tim_tmp=true85_cmipyr{usem(i)};
  tt=find(tim_tmp==1870):find(tim_tmp==2020);
  plot( true85_cmipyr{usem(i)}(tt),true85_cmip{usem(i)}(tt),'k','linewidth',2)
  xlim([1850,2100])
  ylim([-1,5])
  title(mdls(usem(i)),'interpreter','none');
  ylabel('(K)')
end


   set(gcf, 'PaperPosition', [0 0 8 8]);
set(gcf, 'PaperSize', [8 8]); 
print(gcf,'-dpdf','-painters',['cmip.pdf']);


  
