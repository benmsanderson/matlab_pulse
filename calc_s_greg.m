function [s t r]=calc_s_greg(p)
  fcg=5.35*log(4)*ones(150,1);
%  p_t=p(8:16);
  t=t_rsp(p,fcg);
  r=-r_rsp(p,fcg);

  b=regress(t,[r,ones(size(r))]);

  s=b(2);