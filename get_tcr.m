function [tcr tcr4]=get_tcr(tmp)

tcm=t_rsp(tmp,5.35*log(1.01)*[1:140]',[1:140]);
     tcr=tcm(70);
     tcr4=tcm(140);