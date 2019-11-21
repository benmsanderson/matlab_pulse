function [s dr t r a]=calc_s_greg_noise(p,d,ta)
  sfcg=(5.35*log(4))*ones(150,1);
  dfcg=0*ones(ta,1);
  fcg=[dfcg;sfcg];
  fcg=fcg+randn(size(fcg))*d;
				%  p_t=p(8:16);
%  p
  to=t_rsp(p,fcg);
  ro=-r_rsp(p,fcg);
  t=to-mean(to((ta-99):ta));
  r=ro-mean(ro((ta-99):ta));
  b=regress(t(end-149:end),[r(end-149:end),ones(150,1)]);
  a=t(end);
  s=b(2);
  dr=regress(t(200:ta),[200:ta]');
