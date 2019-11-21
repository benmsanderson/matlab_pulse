for i=1:numel(mdls)
  if isfield(ens.(mdls{i}),'rcp26')
    t_26(i)=mean(ens.(mdls{i}).rcp26.tas{1}(221:231))-mean(ens.(mdls{i}).rcp26.tas{1}(101:130));
  else
    t_26(i)=NaN;
  end
  
  if isfield(ens.(mdls{i}),'rcp45')
    t_45(i)=mean(ens.(mdls{i}).rcp45.tas{1}(221:231))-mean(ens.(mdls{i}).rcp45.tas{1}(101:130));
  else
    t_45(i)=NaN;
  end
  
  if isfield(ens.(mdls{i}),'rcp85')
    t_85(i)=mean(ens.(mdls{i}).rcp85.tas{1}(221:231))-mean(ens.(mdls{i}).rcp85.tas{1}(101:130));
  else
    t_85(i)=NaN;
  end
  
end

figure(2)
clf
subplot(4,3,1)
plot(sens_act,t_26,'k.')
[b,bint,r,rint,stats]=regress(t_26',[sens_act;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])
xlim([0,6])
ylim([0,6])
xlabel('EffCS (K)')
ylabel('(K)')
title('RCP2.6 (2090s-1990s)')
subplot(4,3,2)
plot(sens_act,t_45,'k.')
[b,bint,r,rint,stats]=regress(t_45',[sens_act;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])
title('RCP4.5 (2090s-1990s)')

xlabel('EffCS (K)')
ylabel('(K)')
xlim([0,6])
ylim([0,6])

subplot(4,3,3)
plot(sens_act,t_85,'k.')
[b,bint,r,rint,stats]=regress(t_85',[sens_act;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])

xlim([0,6])
ylim([0,6])
title('RCP8.5 (2090s-1990s)')

xlabel('EffCS (K)')
ylabel('(K)')

subplot(4,3,4)
plot(tcr_act,t_26,'k.')
xlabel('TCR (K)')
ylabel('(K)')
[b,bint,r,rint,stats]=regress(t_26',[tcr_act;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(0.5,5,['R^2=' num2str(stats(1),'%0.2f')])
xlim([0,4])
ylim([0,6])
title('RCP2.6 (2090s-1990s)')

subplot(4,3,5)
plot(tcr_act,t_45,'k.')

[b,bint,r,rint,stats]=regress(t_45',[tcr_act;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(0.5,4,['R^2=' num2str(stats(1),'%0.2f')])
title('RCP4.5 (2090s-1990s)')
xlim([0,4])
ylim([0,6])
xlabel('TCR (K)')
ylabel('(K)')
subplot(4,3,6)
plot(tcr_act,t_85,'k.')
title('RCP8.5 (2090s-1990s)')

[b,bint,r,rint,stats]=regress(t_85',[tcr_act;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(0.5,5,['R^2=' num2str(stats(1),'%0.2f')])
xlim([0,4])
ylim([0,6])

xlabel('TCR (K)')
ylabel('(K)')

subplot(4,3,7)
plot(tcr_act4,t_26,'.k')
title('RCP2.6 (2090s-1990s)')

[b,bint,r,rint,stats]=regress(t_26',[tcr_act4;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])
xlim([0,6])
ylim([0,6])

xlabel('T140 (K)')
ylabel('(K)')
caxis([0.5,1])
subplot(4,3,8)
scatter(tcr_act4,t_45,'.k')
title('RCP4.5 (2090s-1990s)')

[b,bint,r,rint,stats]=regress(t_45',[tcr_act4;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])

xlim([0,6])
ylim([0,6])

xlabel('T140 (K)')
ylabel('(K)')
subplot(4,3,9)
scatter(tcr_act4,t_85,'.k')
title('RCP8.5 (2090s-1990s)')

[b,bint,r,rint,stats]=regress(t_85',[tcr_act4;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])

xlim([0,6])
ylim([0,6])

xlabel('T140 (K)')
ylabel('(K)')

subplot(4,3,10)
scatter(a140,t_26,'k.')

[b,bint,r,rint,stats]=regress(t_26',[a140;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])

xlim([0,8])
ylim([0,6])

xlabel('A140 (K)')
ylabel('(K)')
title('RCP2.6 (2090s-1990s)')

subplot(4,3,11)
scatter(a140,t_45,'k.')'

[b,bint,r,rint,stats]=regress(t_45',[a140;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])
title('RCP4.5 (2090s-1990s)')

xlim([0,8])
ylim([0,6])

xlabel('A140 (K)')
ylabel('(K)')
subplot(4,3,12)
scatter(a140,t_85,'k.')

[b,bint,r,rint,stats]=regress(t_85',[a140;ones(size(sens_act))]')
hold on
plot([0,10],[0,1;10,1]*b,'k--')
text(1,5,['R^2=' num2str(stats(1),'%0.2f')])

xlim([0,8])
ylim([0,6])

xlabel('A140 (K)')
ylabel('(K)')
title('RCP8.5 (2090s-1990s)')

   set(gcf, 'PaperPosition', [0 0 6 8]);
set(gcf, 'PaperSize', [ 6 8 ]); 
print(gcf,'-dpdf','-painters',['senscons.pdf']);
