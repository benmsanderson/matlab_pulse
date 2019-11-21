function [t tp]=r_rsp(pt,fcg,ts)

if nargin<3
    ts=1:numel(fcg);
end
%fraction of forcing allocated to slow and fast pool
rf=pt(12);
rf(2)=1-pt(12);

tt=pt(10:11);


dfcg=diff([0 fcg']);


tf=(-exp(-repmat(ts,2,1)./repmat(tt(:),1,numel(ts))));
tp=filter(dfcg,1,tf(:,:)'*diag(rf));

t=sum(tp,2);
