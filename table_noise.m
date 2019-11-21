[b,~,~,~,stats]=regress(tcr4mat',[tcr4mat',ones(size(tcr4mat_both'))]);
rt(1,1)=stats(1);
[b,~,~,~,stats]=regress(tcr4mat',[gregmat',ones(size(tcr4mat_both'))]);
rt(1,2)=stats(1);
 [b,~,~,~,stats]=regress(tcr4mat',[stmat(:,150),ones(size(tcr4mat_drift'))]);
rt(1,3)=stats(1);

[b,~,~,~,stats]=regress(tcr4mat',[tcr4mat_drift',ones(size(tcr4mat_both'))]);
rt(1,4)=stats(1);
[b,~,~,~,stats]=regress(tcr4mat',[gregmat_drift',ones(size(tcr4mat_both'))]);
rt(1,5)=stats(1);
 [b,~,~,~,stats]=regress(tcr4mat',[drift_a140',ones(size(tcr4mat_drift'))]);
rt(1,6)=stats(1);

[b,~,~,~,stats]=regress(tcr4mat',[tcr4mat_tnoise',ones(size(tcr4mat_both'))]);
rt(1,7)=stats(1);
[b,~,~,~,stats]=regress(tcr4mat',[gregmat_tnoise',ones(size(tcr4mat_both'))]);
rt(1,8)=stats(1);
 [b,~,~,~,stats]=regress(tcr4mat',[tnoise_a140',ones(size(tcr4mat_drift'))]);
 rt(1,9)=stats(1);
 
[b,~,~,~,stats]=regress(tcr4mat',[tcr4mat_both',ones(size(tcr4mat_both'))]);
rt(1,10)=stats(1);
[b,~,~,~,stats]=regress(tcr4mat',[gregmat_both',ones(size(tcr4mat_both'))]);
rt(1,11)=stats(1);
[b,~,~,~,stats]=regress(tcr4mat',[both_a140',ones(size(tcr4mat_drift'))]);
rt(1,12)=stats(1);

 %%
[b,~,~,~,stats]=regress(gregmat',[tcr4mat',ones(size(tcr4mat_both'))]);
rt(2,1)=stats(1);
[b,~,~,~,stats]=regress(gregmat',[gregmat',ones(size(tcr4mat_both'))]);
rt(2,2)=stats(1);
 [b,~,~,~,stats]=regress(gregmat',[stmat(:,150),ones(size(tcr4mat_drift'))]);
rt(2,3)=stats(1);

[b,~,~,~,stats]=regress(gregmat',[tcr4mat_drift',ones(size(tcr4mat_both'))]);
rt(2,4)=stats(1);
[b,~,~,~,stats]=regress(gregmat',[gregmat_drift',ones(size(tcr4mat_both'))]);
rt(2,5)=stats(1);
 [b,~,~,~,stats]=regress(gregmat',[drift_a140',ones(size(tcr4mat_drift'))]);
rt(2,6)=stats(1);

[b,~,~,~,stats]=regress(gregmat',[tcr4mat_tnoise',ones(size(tcr4mat_both'))]);
rt(2,7)=stats(1);
[b,~,~,~,stats]=regress(gregmat',[gregmat_tnoise',ones(size(tcr4mat_both'))]);
rt(2,8)=stats(1);
 [b,~,~,~,stats]=regress(gregmat',[tnoise_a140',ones(size(tcr4mat_drift'))]);
 rt(2,9)=stats(1);
 
[b,~,~,~,stats]=regress(gregmat',[tcr4mat_both',ones(size(tcr4mat_both'))]);
rt(2,10)=stats(1);
[b,~,~,~,stats]=regress(gregmat',[gregmat_both',ones(size(tcr4mat_both'))]);
rt(2,11)=stats(1);
[b,~,~,~,stats]=regress(gregmat',[both_a140',ones(size(tcr4mat_drift'))]);
rt(2,12)=stats(1);
 

 %%
[b,~,~,~,stats]=regress(stmat(:,150),[tcr4mat',ones(size(tcr4mat_both'))]);
rt(3,1)=stats(1);
[b,~,~,~,stats]=regress(stmat(:,150),[gregmat',ones(size(tcr4mat_both'))]);
rt(3,2)=stats(1);
 [b,~,~,~,stats]=regress(stmat(:,150),[stmat(:,150),ones(size(tcr4mat_drift'))]);
rt(3,3)=stats(1);

[b,~,~,~,stats]=regress(stmat(:,150),[tcr4mat_drift',ones(size(tcr4mat_both'))]);
rt(3,4)=stats(1);
[b,~,~,~,stats]=regress(stmat(:,150),[gregmat_drift',ones(size(tcr4mat_both'))]);
rt(3,5)=stats(1);
 [b,~,~,~,stats]=regress(stmat(:,150),[drift_a140',ones(size(tcr4mat_drift'))]);
rt(3,6)=stats(1);

[b,~,~,~,stats]=regress(stmat(:,150),[tcr4mat_tnoise',ones(size(tcr4mat_both'))]);
rt(3,7)=stats(1);
[b,~,~,~,stats]=regress(stmat(:,150),[gregmat_tnoise',ones(size(tcr4mat_both'))]);
rt(3,8)=stats(1);
 [b,~,~,~,stats]=regress(stmat(:,150),[tnoise_a140',ones(size(tcr4mat_drift'))]);
 rt(3,9)=stats(1);
 
[b,~,~,~,stats]=regress(stmat(:,150),[tcr4mat_both',ones(size(tcr4mat_both'))]);
rt(3,10)=stats(1);
[b,~,~,~,stats]=regress(stmat(:,150),[gregmat_both',ones(size(tcr4mat_both'))]);
rt(3,11)=stats(1);
[b,~,~,~,stats]=regress(stmat(:,150),[both_a140',ones(size(tcr4mat_drift'))]);
rt(3,12)=stats(1);
 

 %%
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[tcr4mat',ones(size(tcr4mat_both'))]);
rt(4,1)=stats(1);
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[gregmat',ones(size(tcr4mat_both'))]);
rt(4,2)=stats(1);
 [b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[stmat(:,150),ones(size(tcr4mat_drift'))]);
rt(4,3)=stats(1);

[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[tcr4mat_drift',ones(size(tcr4mat_both'))]);
rt(4,4)=stats(1);
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[gregmat_drift',ones(size(tcr4mat_both'))]);
rt(4,5)=stats(1);
 [b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[drift_a140',ones(size(tcr4mat_drift'))]);
rt(4,6)=stats(1);

[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[tcr4mat_tnoise',ones(size(tcr4mat_both'))]);
rt(4,7)=stats(1);
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[gregmat_tnoise',ones(size(tcr4mat_both'))]);
rt(4,8)=stats(1);
 [b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[tnoise_a140',ones(size(tcr4mat_drift'))]);
 rt(4,9)=stats(1);
 
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[tcr4mat_both',ones(size(tcr4mat_both'))]);
rt(4,10)=stats(1);
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[gregmat_both',ones(size(tcr4mat_both'))]);
rt(4,11)=stats(1);
[b,~,~,~,stats]=regress(tomat85(:,335)-tomat85(:,235),[both_a140',ones(size(tcr4mat_drift'))]);
rt(4,12)=stats(1);
 

 %%
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[tcr4mat',ones(size(tcr4mat_both'))]);
rt(5,1)=stats(1);
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[gregmat',ones(size(tcr4mat_both'))]);
rt(5,2)=stats(1);
 [b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[stmat(:,150),ones(size(tcr4mat_drift'))]);
rt(5,3)=stats(1);

[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[tcr4mat_drift',ones(size(tcr4mat_both'))]);
rt(5,4)=stats(1);
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[gregmat_drift',ones(size(tcr4mat_both'))]);
rt(5,5)=stats(1);
 [b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[drift_a140',ones(size(tcr4mat_drift'))]);
rt(5,6)=stats(1);

[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[tcr4mat_tnoise',ones(size(tcr4mat_both'))]);
rt(5,7)=stats(1);
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[gregmat_tnoise',ones(size(tcr4mat_both'))]);
rt(5,8)=stats(1);
 [b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[tnoise_a140',ones(size(tcr4mat_drift'))]);
 rt(5,9)=stats(1);
 
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[tcr4mat_both',ones(size(tcr4mat_both'))]);
rt(5,10)=stats(1);
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[gregmat_both',ones(size(tcr4mat_both'))]);
rt(5,11)=stats(1);
[b,~,~,~,stats]=regress(tomat26(:,335)-tomat26(:,235),[both_a140',ones(size(tcr4mat_drift'))]);
rt(5,12)=stats(1);
 

lbl={'T140','EffCS','A140','RCP8.5 2000-2100','RCP2.6 2000-2100'}';
prd={'T140 (true)','EffCS (true)','A140 (true)','T140 (drift)','EffCS (drift)','A140 (drift)','T140 (noise)','EffCS (noise)','A140 (noise)','T140 (drift+noise)','EffCS (drift+noise)','A140 (drift+noise)'};
input.data= [prd;[cellfun(@(x) sprintf('%0.2f',x),num2cell(rt),'UniformOutput',0)]]';
input.dataFormat = {'%s',6};
  input.dataNanString = '-';
   input.tableColumnAlignment = 'l';
   input.tableBorders = 1;
   input.booktabs = 1;
   input.tableCaption = ['A table showing $R^2$ regression statistics relating a set of predictors to a set of unbiased model properties.  Predictors are Transient Climate Sensitivity at quadrupling of CO2 (T140), Effective Climate Sensitivity (EffCS) and warming 140 years after a quadrupling of CO2 (A140), additional rows show these values measured experiments conducted with unequilibrated base climates (drift), additive Gaussian noise (noise) and a combination of both factors (drift+noise).  Output model properties  (T140, EffCS, A140, RCP8.5 and RCP2.6 warming) are derived from the equilibrated model without noise.'];
   input.tableLabel = 'Pevents';
   input.makeCompleteLatexDocument = 0;
  input.tableColLabels = {'Predictor','T140','EffCS','A140','RCP8.5 2000-2100','RCP2.6 2000-2100'}';
    input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'column' is used

out=latexTable(input);
