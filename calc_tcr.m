function [tcr,tcr_140,tcr_10,t]=calc_tcr(p)
  fcg=5.35*log([1.01.^([1:150])])';;
%  p_t=p(8:16);
  t=t_rsp(p,fcg);
  tcr=t(70);
  tcr_140=t(140);
  tcr_10=mean(t(1:10));
				%  r=-r_rsp(p_t,fcg);

%  b=regress(t,[r,ones(size(r))]);

%  s=b(2);
