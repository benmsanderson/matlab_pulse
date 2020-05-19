n=0
tcr_corr=NaN(numel(mdls),1);
tcr_org=NaN(numel(mdls),1);
trnd_corr=NaN(numel(mdls),1);
for i=1:numel(mdls)
  if and(isfield(ens.(mdls{i}),'piControl'),isfield(ens.(mdls{i}),'onepctCO2'))

    [b,bint,r,~,stats] =regress(ens.(mdls{i}).piControl.tas{1},[(1:numel(ens.(mdls{i}).piControl.tas{1}))',ones(size(ens.(mdls{i}).piControl.tas{1}))]);
    [b1,bint,~,~,stats] =regress(ens.(mdls{i}).onepctCO2.tas{1}(1:20),[(1:20)',ones(20,1)]);
    mn(i)=b1(2);
  tt=(b(2)-b1(2))/(b(1));
  strtg(i)=min(max(1,-floor(tt)),numel(ens.(mdls{i}).piControl.tas{1}));

  tcr_org(i)=mean(ens.(mdls{i}).onepctCO2.tas{1}(131:140))-mean(ens.(mdls{i}).piControl.tas{1});
  tcr_corr(i)=mean(ens.(mdls{i}).onepctCO2.tas{1}(131:140))-mn(i);
  if numel(ens.(mdls{i}).piControl.tas{1})>=(strtg(i)+150)
    disp('yup')
    trnd_corr(i)=mean(ens.(mdls{i}).piControl.tas{1}(strtg(i)+(131:150)))-mean(ens.(mdls{i}).piControl.tas{1}(strtg(i)+(1:20)));;
  else
    trnd_corr(i)=0;
  end
  end
end
%GFDL stopped at year 170
tcr_corr(22)=NaN;
tcr_corr(21)=NaN;

tcr_org(22)=NaN;
tcr_org(21)=NaN;


sens_org=NaN(numel(mdls),1);
sens_corr=NaN(numel(mdls),1);
trnd_corrs=NaN(numel(mdls),1);

a140_org=NaN(numel(mdls),1);
a140_corr=NaN(numel(mdls),1);



for i=1:numel(mdls)
  if and(isfield(ens.(mdls{i}),'piControl'),isfield(ens.(mdls{i}),'abrupt4xCO2'))
    if isfield(ens.(mdls{i}).piControl,'rlut')
      if numel(ens.(mdls{i}).abrupt4xCO2.tas{1})>139

%ts=ceil(rand*(nt-51));
  bsln_org=mean(ens.(mdls{i}).piControl.tas{1});
bsln_rl=mean(ens.(mdls{i}).piControl.rlut{1});
bsln_rs=mean(ens.(mdls{i}).piControl.rsut{1});

bsln_t=mn(i);
if strtg(i)<=50
bsln_trl=mean(ens.(mdls{i}).piControl.rlut{1});
bsln_trs=mean(ens.(mdls{i}).piControl.rsut{1});
else
bsln_trl=mean(ens.(mdls{i}).piControl.rlut{1}((strtg(i)-50):strtg(i)));
bsln_trs=mean(ens.(mdls{i}).piControl.rsut{1}((strtg(i)-50):strtg(i)));
end


a=((ens.(mdls{i}).abrupt4xCO2.tas{1}-bsln_t));
a2=((ens.(mdls{i}).abrupt4xCO2.tas{1}-bsln_org));

	rs=((ens.(mdls{i}).abrupt4xCO2.rsut{1}-bsln_trs));
	rl=((ens.(mdls{i}).abrupt4xCO2.rlut{1}-bsln_trl));

	rs2=((ens.(mdls{i}).abrupt4xCO2.rsut{1}-bsln_rs));
	rl2=((ens.(mdls{i}).abrupt4xCO2.rlut{1}-bsln_rl));
		
	b=regress([a],[-rs-rl,ones(size(a))]);
	b2=regress([a2],[-rs2-rl2,ones(size(a2))]);

	sens_org(i)=b2(2)/2;
	sens_corr(i)=b(2)/2;
	a140_org(i)=mean(a2(121:140));
	a140_corr(i)=mean(a(121:140));


  if numel(ens.(mdls{i}).piControl.tas{1})>=(strtg(i)+150)
    disp('yup')
    trnd_corrs(i)=mean(ens.(mdls{i}).piControl.tas{1}(strtg(i)+(131:150)))-mean(ens.(mdls{i}).piControl.tas{1}(strtg(i)+(1:20)));;
  else
    trnd_corrs(i)=0;
  end
    end
    end
  end
end





t2100=NaN(numel(mdls),1);
t2020=NaN(numel(mdls),1);

for i=1:numel(mdls)
  if isfield(ens.(mdls{i}),'rcp85')
    yrs=ens.(mdls{i}).rcp85.year{1};
    usetim=find(and(yrs>2080,yrs<=2100));
    t2100(i)=mean(ens.(mdls{i}).rcp85.tas{1}(usetim));
    usetim=find(and(yrs>2000,yrs<=2020));
    t2020(i)=mean(ens.(mdls{i}).rcp85.tas{1}(usetim));
  else
    t2100(i)=NaN;
    t2020(i)=NaN;
  end
end
figure(1)
clf
subplot(1,3,1)
p1=plot(tcr_org,t2100-t2020,'x','color',[0.75,0.75,.75])
	b=regress(t2100-t2020,[tcr_org,ones(size(tcr_org))]);
hold on
	plot([2.5,5.5],[2.5,5.5;1,1]'*b,':','color',[0.75,0.75,.75])

%	plot(tcr_corr,t2100-t2020,'ko')
%	b=regress(t2100-t2020,[tcr_corr,ones(size(tcr_org))]);
%	plot([2.5,5.5],[2.5,5.5;1,1]'*b,'k--')	
p2=plot(tcr_corr-trnd_corr,t2100-t2020,'ko')
	b=regress(t2100-t2020,[tcr_corr-trnd_corr,ones(size(tcr_org))]);
	plot([2.5,5.5],[2.5,5.5;1,1]'*b,'k--')
	cc=corr(tcr_org,t2100-t2020,'rows','pairwise')
	cc2=corr(tcr_corr-trnd_corr,t2100-t2020,'rows','pairwise')

	legend([p1,p2],['Original R^2=' num2str(cc(1),'%0.2f')],['Corrected R^2=' num2str(cc2(1),'%0.2f')],'location','southeast')
	ylabel({'21st century warming RCP8.5','(2081-2100)-(2001-2020) (K)'})
	xlabel({'TCR (K)'})
	title('(a)')
ylim([1,4.5])

subplot(1,3,2)

p1=plot(sens_org,t2100-t2020,'x','color',[0.75,0.75,.75])
	b=regress(t2100-t2020,[sens_org,ones(size(tcr_org))]);
hold on
	plot([1,4.5],[1,4.5;1,1]'*b,':','color',[0.75,0.75,.75])


%plot(sens_corr,t2100-t2020,'ro')
	p2=plot(sens_corr-trnd_corrs/2,t2100-t2020,'ko')
	b=regress(t2100-t2020,[sens_corr-trnd_corrs/2,ones(size(tcr_org))]);
hold on
	plot([1,4.5],[1,4.5;1,1]'*b,':','color',[0.75,0.75,.75])	

	cc=corr(sens_org,t2100-t2020,'rows','pairwise')
	cc2=corr(sens_corr-trnd_corrs/2,t2100-t2020,'rows','pairwise')

legend([p1,p2],['Original R^2=' num2str(cc(1),'%0.2f')],['Corrected R^2=' num2str(cc2(1),'%0.2f')],'location','southeast')
	ylabel({'21st century warming RCP8.5','(2081-2100)-(2001-2020) (K)'})
	xlabel({'Effective Climate Sensitivity (K)'})
%text(tcr_corr,t2100-t2020,mdls);
	title('(b)')
ylim([1,4.5])

 
subplot(1,3,3)

p1=plot(a140_org,t2100-t2020,'x','color',[0.75,0.75,.75])
	b=regress(t2100-t2020,[a140_org,ones(size(tcr_org))]);
hold on
	plot([2,6],[2,6;1,1]'*b,':','color',[0.75,0.75,.75])


%plot(sens_corr,t2100-t2020,'ro')
	p2=plot(a140_corr-trnd_corr,t2100-t2020,'ko')
	b=regress(t2100-t2020,[a140_corr-trnd_corr,ones(size(tcr_org))]);
hold on
	plot([2,6],[2,6;1,1]'*b,':','color',[0.75,0.75,.75])	

	cc=corr(a140_org,t2100-t2020,'rows','pairwise')
	cc2=corr(a140_corr-trnd_corr,t2100-t2020,'rows','pairwise')

legend([p1,p2],['Original R^2=' num2str(cc(1),'%0.2f')],['Corrected R^2=' num2str(cc2(1),'%0.2f')],'location','southeast')
	ylabel({'21st century warming RCP8.5','(2081-2100)-(2001-2020) (K)'})
	xlabel({'A140 (K)'})
%text(tcr_corr,t2100-t2020,mdls);
	title('(c)')
ylim([1,4.5])
 
 
   set(gcf, 'PaperPosition', [0 0 12 4]);
set(gcf, 'PaperSize', [12 4]); 
print(gcf,'-dpdf','-painters',['cmip_corr.pdf']);

figure(2)

strtg(1)=100;
strtg(13)=200;
n=0
for i=1:numel(mdls)
  if and(isfield(ens.(mdls{i}),'piControl'),isfield(ens.(mdls{i}),'onepctCO2'))
        n=n+1;
subplot(7,6,n)
plot(ens.(mdls{i}).piControl.tas{1}-mn(i),'k');

hold on
	plot([-300,300]+strtg(i),[-300,300]*trnd_corr(i)/140,':','color','k')	

  hold on;

  plot(strtg(i)+(1:numel(ens.(mdls{i}).onepctCO2.tas{1})),ens.(mdls{i}).onepctCO2.tas{1}-mn(i),'b');
    if isfield(ens.(mdls{i}),'abrupt4xCO2')
      plot(strtg(i)+(1:numel(ens.(mdls{i}).abrupt4xCO2.tas{1})),ens.(mdls{i}).abrupt4xCO2.tas{1}-mn(i),'r');
    end
    
grid on
  hold off;
  mdls{i}
  title(mdls{i},'interpreter','none')
  ylim([-2,6])
  xlim([strtg(i)-300,strtg(i)+300])
  ylabel('(K)')
  xlabel('Control Year')
  end
end

 
   set(gcf, 'PaperPosition', [0 0 9 9]);
set(gcf, 'PaperSize', [9 9]); 
print(gcf,'-dpdf','-painters',['branch_illus.pdf']);
