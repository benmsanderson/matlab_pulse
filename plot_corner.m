addpath('gwmcmc/')
sdp=[1,2,3,5,6,7,8,9,10,11,12,13];

figure(4)
clf

for i=1:numel(sdp)
   subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+i)
   bins=linspace(pmin(sdp(i)),pmax(sdp(i)),10);
   histogram(mdlpstnl(sdp(i),:,end),bins,'EdgeColor',[0.5,0.5,0.5],'FaceColor',[0.5,0.5,0.5])

   title({pname{sdp(i)}})

  for j=1:(i-1)
    subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+j)
    plot(mdlpstnl(sdp(j),:,end),mdlpstnl(sdp(i),:,end),'.','color',[0.5,0.5,.5])
    hold on

    xlim([pmin(sdp(j)),pmax(sdp(j))])
    ylim([pmin(sdp(i)),pmax(sdp(i))])
    if j==1
      ylabel(pname{sdp(i)})
    end
    if i==numel(sdp)
      xlabel(pname{sdp(j)})
    end
    
  end
end



set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['corner_unbiased.pdf'])

clf


for i=1:numel(sdp)
   subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+i)
   bins=linspace(pmin(sdp(i)),pmax(sdp(i)),10);
   histogram(mdlpstnl(sdp(i),:,end),bins,'EdgeColor',[0.5,0.5,0.5],'FaceColor',[0.5,0.5,0.5])
   hold on
   histogram(mdlpstcf(sdp(i),:,end),bins,'EdgeColor',[0.8,0.5,0.3],'FaceColor',[0.8,0.5,0.3],'Facealpha',0.3)

   
   title({pname{sdp(i)}})

  for j=1:(i-1)
    subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+j)
    plot(mdlpstnl(sdp(j),:,end),mdlpstnl(sdp(i),:,end),'.','color',[0.5,0.5,.5])
    hold on
    plot(mdlpstcf(sdp(j),:,end),mdlpstcf(sdp(i),:,end),'.','color',[0.8,0.5,.5,0.3])

    xlim([pmin(sdp(j)),pmax(sdp(j))])
    ylim([pmin(sdp(i)),pmax(sdp(i))])
    if j==1
      ylabel(pname{sdp(i)})
    end
    if i==numel(sdp)
      xlabel(pname{sdp(j)})
    end
    
  end
end

set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['corner_paleo.pdf'])

clf



for i=1:numel(sdp)
   subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+i)
   bins=linspace(pmin(sdp(i)),pmax(sdp(i)),10);
   histogram(mdlpstnl(sdp(i),:,end),bins,'EdgeColor',[0.5,0.5,0.5],'FaceColor',[0.5,0.5,0.5])
   hold on
   histogram(mdlpstml(sdp(i),:,end),bins,'EdgeColor',[0.8,0.5,0.3],'FaceColor',[0.8,0.5,0.3],'Facealpha',0.3)

   
   title({pname{sdp(i)}})

  for j=1:(i-1)
    subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+j)
    plot(mdlpstnl(sdp(j),:,end),mdlpstnl(sdp(i),:,end),'.','color',[0.5,0.5,.5])
    hold on
    plot(mdlpstml(sdp(j),:,end),mdlpstml(sdp(i),:,end),'.','color',[0.8,0.5,.5,0.3])

    xlim([pmin(sdp(j)),pmax(sdp(j))])
    ylim([pmin(sdp(i)),pmax(sdp(i))])
    if j==1
      ylabel(pname{sdp(i)})
    end
    if i==numel(sdp)
      xlabel(pname{sdp(j)})
    end
    
  end
end


set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['corner_millar.pdf'])

clf

for i=1:numel(sdp)
   subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+i)
   bins=linspace(pmin(sdp(i)),pmax(sdp(i)),10);
   histogram(mdlpstnl(sdp(i),:,end),bins,'EdgeColor',[0.5,0.5,0.5],'FaceColor',[0.5,0.5,0.5])
   hold on
   histogram(mdlpst(sdp(i),:,end),bins,'EdgeColor',[0.8,0.5,0.3],'FaceColor',[0.8,0.5,0.3],'Facealpha',0.3)

   title({pname{sdp(i)}})

  for j=1:(i-1)
    subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+j)
    plot(mdlpstnl(sdp(j),:,end),mdlpstnl(sdp(i),:,end),'.','color',[0.5,0.5,.5])
    hold on
    plot(mdlpst(sdp(j),:,end),mdlpst(sdp(i),:,end),'.','color',[0.8,0.5,.5,0.3])

    xlim([pmin(sdp(j)),pmax(sdp(j))])
    ylim([pmin(sdp(i)),pmax(sdp(i))])
    if j==1
      ylabel(pname{sdp(i)})
    end
    if i==numel(sdp)
      xlabel(pname{sdp(j)})
    end
    
  end
end

set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['corner_heat.pdf'])
