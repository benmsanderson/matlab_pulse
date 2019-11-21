function [s dr t r a]=calc_s_greg_drift(p,d,ta,argen)
  if nargin<4
    randts=zeros(ta+150,1);
  else
    randts=simulate(argen,ta+150);
  end
  
  sfcg=(5.35*log(4)+d)*ones(150,1);
  dfcg=[0;d*ones(ta-1,1)];
  fcg=[dfcg;sfcg];
  
				%  p_t=p(8:16);
%  p
  to=t_rsp(p,fcg);
  ro=-r_rsp(p,fcg);
  t=to+randts;
  t=t-mean(t((ta-99):ta));
  r=ro-mean(ro((ta-99):ta));
  b=regress(t((end-149):end),[r((end-149):end),ones(150,1)]);
  s=b(2);

  
%  b=regress(r((ta+1):end),[ones(size(t((ta+1):end))),t((ta+1):end)]);
%  s=-5.35*log(4)/b(2);
  
  a=mean(t((end-10):end));
  dr=regress(t((ta-200):ta),[(ta-200):ta]');
