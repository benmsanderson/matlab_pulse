function [tim u_emis]=read_emis(scen,tim,t_filt,dsol,dir)
  if nargin<5
    dir='.';
  end
  
fn=[dir '/' scen '_EMISSIONS.xls'];
fld=[scen '_EMISSIONS'];

if strmatch(fld,'RCP45SCP45TO3PD_EMISSIONS');
  fld='RCP45SCP45to3PD_EMISSIONS'
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
u_emis=[fcg_ts(:,1)+fcg_ts(:,2)];

