function [tim u_fcg_2100 fcg_2100 fcg_typ]=read_nonco2(scen,tim,t_filt,dsol)
fn=[scen '_MIDYEAR_RADFORCING.xls'];
fld=[scen '_MIDYEAR_RADFORCING'];
if strmatch(fld,'RCP45SCP45TO3PD_MIDYEAR_RADFORCING')
  fld='RCP45SCP45to3PD_MIDYEAR_RADFOR'
end

if nargin<2
 tim=1765:2300;
end

tend=(tim(end)-2300)+548;
tstrt=(tim(1)-2300)+548;

[a b]=xlsread(fn,fld);
fcg_yr=a(tstrt:tend,1);
 fcg_typ=b(end,2:end);
fcg_ts=a(tstrt:tend,2:end);

%u_fcg=fcg_ts(1:94,2:4);
%u_fcg=[fcg_ts(1:165,4),fcg_ts(1:165,1)-fcg_ts(1:165,4),ones(size(fcg_ts(1:165,:),1),1)];




clear u_fcg_2100 fcg_2100
u_fcg_2100=fcg_ts(:,[8]);


u_fcg_2100(:,2)=fcg_ts(:,4)-fcg_ts(:,5);

%u_fcg_2100=u_fcg_2100-repmat(mean(u_fcg_2100(1:20,:),1),numel(tim),1);

fcg_2100=fcg_typ([8]);
fcg_2100{2}='Anth. non-GHG';



% $$$ [a b]=sort(fcg_ts(:,2))
% $$$ pvolcs= b(1:5);
% $$$ u_fcg_2100(:,3)=0;
% $$$ for i=1:numel(pvolcs)
% $$$ v_ts=fcg_ts(:,2)*0;
% $$$ v_ts(pvolcs(i))=fcg_ts(pvolcs(i),2);
% $$$ nts=numel(v_ts(pvolcs(i):end));
% $$$ v_ts(pvolcs(i):end)=fcg_ts(pvolcs(i),2)*exp(-(0:(nts-1))/2);
% $$$ u_fcg_2100(:,3)=u_fcg_2100(:,3)+v_ts;
% $$$ end
fcg_2100{3}=fcg_typ{2};
u_fcg_2100(:,3)=fcg_ts(:,2);
t_2005=find(tim==2005);
u_fcg_2100(t_2005:end,3)=u_fcg_2100((t_2005-2),3)/10;

fcg_2100{4}=fcg_typ{3};
u_fcg_2100(:,4)=fcg_ts(:,3);

fcg_2100{5}='Non CO2 GHG';
u_fcg_2100(:,5)=fcg_ts(:,5)-fcg_ts(:,8);


if nargin<4
u_fcg_2100(:,4)=u_fcg_2100(:,4)-smooth(u_fcg_2100(:,4),11, ...
                                       'moving');
else
    if dsol==1
        u_fcg_2100(:,4)=u_fcg_2100(:,4)-smooth(u_fcg_2100(:,4),11, ...
                                       'moving');
    end
end

%u_fcg_2100(:,4)=smooth(u_fcg_2100(:,4),25,'loess');

if nargin>2
u_fcg_2100(:,1:2)=tsmovavg(u_fcg_2100(:,1:2),'w',[exp(-[20:-1:1]/t_filt)],1);
u_fcg_2100(1:20,1:2)=0;
end
