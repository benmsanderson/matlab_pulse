addpath('gwmcmc/')
sdp=[8,9,10,11,12,13];
slong={'Slow Sensitivity','Fast Senstivity','Slow Timescale','Fast Timescale','Deep forcing fraction','Non-CO2 scaling'}
figure(4)
clf

for i=1:numel(sdp)
   subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+i)
   bins=linspace(pmin(sdp(i)),pmax(sdp(i)),20);
   histogram(mdlpst(sdp(i),:,end),bins,'EdgeColor',[0.5,0.5,0.5],'FaceColor',[0.5,0.5,0.5])

   title({pname{sdp(i)}})

    if i==numel(sdp)
      xlabel({pname{sdp(i)},slong{i}})
    end
    
  for j=1:(i-1)
    subplot(numel(sdp),numel(sdp),(i-1)*numel(sdp)+j)
    plot(mdlpst(sdp(j),:,end),mdlpstnl(sdp(i),:,end),'.','color',[0.5,0.5,.5])
    hold on

    xlim([pmin(sdp(j)),pmax(sdp(j))])
    ylim([pmin(sdp(i)),pmax(sdp(i))])
    if j==1
      ylabel({pname{sdp(i)},slong{i}})
    end
    if i==numel(sdp)
      xlabel({pname{sdp(j)},slong{j}})
    end
    
  end
end



set(gcf, 'PaperPosition', [0 0 15 12]);
set(gcf, 'PaperSize', [15 12]); 
print(gcf,'-dpdf','-painters',['corner_sens.pdf'])
