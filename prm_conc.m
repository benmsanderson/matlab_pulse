function [pco2 t r rp]=prm_conc(p,conc,c0,f_aer,f_other)
if nargin<3
    c0=285;
end

if nargin<4
    f_aer=conc*0;
end

if nargin<5
    f_other=conc*0;
end

%first - calculate concentrations using decay terms

cfracs=p(1:3);
cfracs(4)=1-sum(p(1:3));

%ct=p(4:7);

%ef=exp(-repmat(1:numel(emis),4,1)./repmat(ct(:),1,numel(emis)));

%c=filter(emis,numel(emis),ef(:,:)'*diag(cfracs));
%c=filter(emis,1,ef(:,:)'*diag(cfracs));


%conc=sum(c,2);
%pco2=conc+c0;
pco2=conc;

fco2=5.35*log(pco2/c0);
fcg=fco2(:)+f_aer(:)*p(13)+f_other;


t=t_rsp(p,fcg);
[r rp]=r_rsp(p,fcg);

