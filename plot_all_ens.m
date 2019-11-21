 function plot_all_ens(cmdl,tends,t_arr,r_arr,t_ens,r_ens,m_lite,mdls)

  figure(6)
 clf
 usemdls=find(~isnan(mean(t_arr)));

for i=1:numel(usemdls)

    sbnds(i,:)=prctile(sum(m_lite{usemdls(i)}(1:3,:,end),1)*3.7,[10,50, ...
                        90]);
     b=regress(-r_arr(:,usemdls(i)),[t_arr(:,usemdls(i)),ones(150,1)]);
sens_greg(i)=-b(2)/b(1)/2;
sens(i,:)=median(m_lite{usemdls(i)}(1:3,:,end)*3.7,2);
end

[duf so]=sort(sbnds(:,2));

so6=find(usemdls(so)>46);
so5=find(usemdls(so)<=46);


clf

 bb=bar(fliplr(sens(so,:)),'stacked')
 

set(bb(1),'FaceColor',[0.6,0.9,0.5],'edgecolor',[0.6,0.9,0.5]/2+0.5)

set(bb(3),'FaceColor',[0.4,0.5,0.9],'edgecolor',[0.4,0.5,0.9]/2+0.5)

set(bb(2),'FaceColor',[0.8,0.8,1.0],'edgecolor',[0.8,0.8,1.0]/2+0.5)


 hold on
 cols=[[0.6,0.9,0.5];[0.4,0.5,0.9];[0.8,0.8,1.0];[0.5,0.5,0.5]]

 eb=errorbar(so5,sbnds(so(so5),2),sbnds(so(so5),2)-sbnds(so(so5),1), ...
          sbnds(so(so5),3)-sbnds(so(so5),2),'linestyle','none','color',cols(4,:)/2);
 
 eb=errorbar(so6,sbnds(so(so6),2),sbnds(so(so6),2)-sbnds(so(so6),1), ...
          sbnds(so(so6),3)-sbnds(so(so6),2),'linestyle','none','color',[0.9,0.5,0.5]);
 
 gg=plot(so5,sens_greg(so(so5)),'kd','markerfacecolor',[0.5,0.5, ...
                     0.5])
 gg2=plot(so6,sens_greg(so(so6)),'kd','markerfacecolor',[0.9,0.5, ...
                     0.5])
 set(gca,'xtick',[1:numel(usemdls)])
  set(gca,'ytick',[0:2:20])

  set(gca,'xticklabel',cellfun(@(x) strrep(x,'_','-'),mdls(usemdls(so)),'UniformOutput',0))
set(gca,'XTickLabelRotation',90)
title('Equilibrium Climate Sensitivity to a doubling of Carbon Dioxide')
ylabel('(K)')
xlim([0.25,0.75+numel(usemdls)])
ylim([0,20])

legend([bb,eb,gg,gg2],'Fast Mode','Mixed Mode','Slow Mode',['LTE ' ...
                    'Uncertainty'],'CF estimate (CMIP5 model)','CF Estimate (CMIP6 model)', ...
       'location','northwest')

grid on
set(gcf, 'PaperPosition', [0 0 10 6]);
set(gcf, 'PaperSize', [10 6]); 
print(gcf,'-dpdf','-painters',['bar.pdf'])


