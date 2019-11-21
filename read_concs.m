function [tim u_emis]=read_concs(scen,tim,t_filt,dsol)
fn=[scen '_MIDYEAR_CONCENTRATIONS.xls'];
fld=[scen '_MIDYEAR_CONCENTRATIONS'];

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
u_emis=[fcg_ts(:,3)];

