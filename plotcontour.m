function co_out=plotcontour(M,bins,prc,gaus)

if nargin<4
    gaus=2
end

A=hist3(M, bins);
h = fspecial('gaussian',[20,20],gaus);
y = filter2(h, A);

y=y/sum(y(:));
cp=@(pp) (sum(y(find(y(:)>pp)))-(1-prc)).^2
opts=optimset('fmincon')
opts.algorithm='sqp'
cl=fmincon(cp,0.001,[],[],[],[],0,.1,[],opts);


bnds=[0:0.000001:0.001];
for i=1:numel(bnds)
    fb(i)=cp(bnds(i));
end
[duf cl]=min(fb);
bnds(cl)
[a b]=meshgrid(bins{1},bins{2});
co=contourc(bins{1},bins{2},y',[1,1]*bnds(cl));

co_out=co(:,2:end);