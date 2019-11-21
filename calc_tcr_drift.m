function [tcr,tcr_140,t]=calc_tcr_drift(p,d,ta,argen)
  if nargin<4
    randts=zeros(ta+150,1);
  else
    randts=simulate(argen,ta+150);
  end
  
  
  sfcg=d+5.35*log([1.01.^([1:150])])';;
    dfcg=d*ones(ta,1);
  fcg=[dfcg;sfcg];

%  p_t=p(8:16);
  to=t_rsp(p,fcg);
  t=to+randts;;
  t=t-mean(t((ta-99):ta));
  tcr=mean(t(ta+(60:80)))-mean(t((ta-100):ta));
  tcr_140=mean(t(end-10:end))-mean(t((ta-99):ta));
  tcr_10=mean(t(1:10));
				%  r=-r_rsp(p_t,fcg);

%  b=regress(t,[r,ones(size(r))]);

%  s=b(2);
