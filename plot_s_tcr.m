function  [tcr_act,tcr_act4,sens_act,a140]=plot_s_tcr(ens,m_lite,mdls,r_arr,t_arr,mdlpst,mdlpstcf,mdlpstnl)
    nl=size(m_lite{1},2);
    for i=1:numel(m_lite)
 b=regress(-r_arr(:,i)/2,[t_arr(:,i)/2,ones(150,1)]);;
 if b(2)/b(1)<0
   sens_act(i)=-b(2)/b(1);
   a140(i)=mean(t_arr(120:150,i));
 else
     sens_act(i)=NaN
     a140(i)=NaN;
 end
    end
    for i=1:numel(m_lite)
        if ~isnan(m_lite{i}(1))
    sens_full(i,:)=sum(m_lite{i}(8:9,:)*5.35*log(2),1);
    sens_err(i,:)=prctile(sens_full(i,:),[10,50,90]);

        else
            sens_full(i,:)=NaN;
            sens_err(i,:)=NaN;
        end
        
    end
    
    
    
    
  for i=1:numel(mdls)
  if and(isfield(ens.(mdls{i}),'onepctCO2'),isfield(ens.(mdls{i}),'piControl'))
      if isfield(ens.(mdls{i}).onepctCO2,'tas')
          offset=mean(ens.(mdls{i}).onepctCO2.tas{1}(1))- ...
                 mean(ens.(mdls{i}).piControl.tas{1}(end-50:end));
          if abs(offset)<10
  tcr_act4(i)=mean(ens.(mdls{i}).onepctCO2.tas{1}(140))- ...
      mean(ens.(mdls{i}).piControl.tas{1}(end-50:end));
    tcr_act(i)=mean(ens.(mdls{i}).onepctCO2.tas{1}(70))-mean(ens.(mdls{i}).piControl.tas{1}(end-50:end));

        else
            tcr_act(i)=NaN;    
            tcr_act4(i)=NaN;    
            
          end
      end
        else
            tcr_act(i)=NaN;
             tcr_act4(i)=NaN;    
           
      end
  end


figure(2)
clf


    millartcr=lognrnd(.458,.278,50000,1);
    millarrwf=randn(50000-0,1)*(0.3).^2+0.6;
    millarecs=millartcr./millarrwf;
    
%plot(millartcr,millarecs,'.','color',[0.8,0.8,0.8]);
 co=plotcontour([millartcr,millarecs],{0:0.1:5 0:0.1:10},0.025,1)

 
 p1=plot(co(1,:),co(2,:),'color',[0.5,0.5,0.5])
 %plot(millartcr,millarecs,'.','color',[0.8,0.8,0.8]);
hold on

p2=plot(tcr_act,sens_act,'ko')
xlabel('TCR at CO_2 doubling (K)')
ylabel('(K)')


hold on
for i=1:numel(mdls)
    p3=plot(tcr_act(i)*[1,1],sens_err(i,[1,3])','-','color',[0.9,0.7, ...
                        0.7])
end


eb=plot(tcr_act,sens_err(:,2),'rx')
ylim([0,20])

legend([p2,p1,p3],'CMIP5/6 ECS','RWF prior','CMIP5/6 ESS','location','northwest')


   set(gcf, 'PaperPosition', [0 0 3.75 4]);
set(gcf, 'PaperSize', [ 3.75 4]); 
print(gcf,'-dpdf','-painters',['s_tcr.pdf']);
