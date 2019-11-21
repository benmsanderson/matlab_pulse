function [ens mdls]=read_ensembles()

ens=read_gm();

load('ens6.mat')
mdl6=fieldnames(ens6);

for i=1:numel(mdl6)
    ens.(mdl6{i})=ens6.(mdl6{i});
if isfield(ens.(mdl6{i}),'onepct')
ens.(mdl6{i}).onepctCO2=ens.(mdl6{i}).onepct;
end
end
ens.BNU_ESM.onepctCO2.tas{1}=ens.BNU_ESM.onepctCO2.tas{1}+mean(ens.BNU_ESM.piControl.tas{1});

ens.UKESM1_0_LL.abrupt4xCO2.rsut{1}= ...
    ens.UKESM1_0_LL.abrupt4xCO2.rsdt{1}-ens.UKESM1_0_LL.abrupt4xCO2.rtmt{1}-ens.UKESM1_0_LL.abrupt4xCO2.rlut{1};

ens.UKESM1_0_LL.piControl.rsut{1}= ...
    ens.UKESM1_0_LL.piControl.rsdt{1}- ...
    ens.UKESM1_0_LL.piControl.rtmt{1}-ens.UKESM1_0_LL.piControl.rlut{1};

mdls=fieldnames(ens);
    
