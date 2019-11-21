figure(1)

%is3=find(abs(gregmat./2-3)<0.1)
[a,b]=sort(abs(gregmat./2-3))
is3=b(1:50);

subplot(4,5,1)
plot(tim21,tomat85(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim21,tomat85(is3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])
title('RCP8.5')

subplot(4,5,2)
plot(tim3000,tomat26(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim3000,tomat26(is3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])
title('RCP2.6')

subplot(4,5,3)
plot(1:150,stcrmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stcrmat(is3,:)','color',[0.9,0.5,0.5])
title('1pctCO2')

subplot(4,5,4)
plot(1:150,stmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stmat(is3,:)','color',[0.9,0.5,0.5])
title('abrupt4xCO2')

subplot(4,5,5)
plot(stmat(:,:)',srmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(stmat(is3,:)',srmat(is3,:)','color',[0.9,0.5,0.5])
title('abrupt4xCO2')



%ist3=find(abs(tcrmat-1.7)<0.1)

[a,b]=sort(abs(tcrmat-1.7))
ist3=b(1:50);

subplot(4,5,6)
plot(tim21,tomat85(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim21,tomat85(ist3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])
subplot(4,5,7)
plot(tim3000,tomat26(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim3000,tomat26(ist3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])


subplot(4,5,8)
plot(1:150,stcrmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stcrmat(ist3,:)','color',[0.9,0.5,0.5])

subplot(4,5,9)
plot(1:150,stmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stmat(ist3,:)','color',[0.9,0.5,0.5])


subplot(4,5,10)
plot(stmat(:,:)',srmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(stmat(ist3,:)',srmat(ist3,:)','color',[0.9,0.5,0.5])
title('abrupt4xCO2')


%ist3=find(abs(tcr4mat-5)<0.1)

[a,b]=sort(abs(tcr4mat-5))
ist3=b(1:50);

subplot(4,5,11)
plot(tim21,tomat85(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim21,tomat85(ist3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])
subplot(4,5,12)
plot(tim3000,tomat26(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim3000,tomat26(ist3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])


subplot(4,5,13)
plot(1:150,stcrmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stcrmat(ist3,:)','color',[0.9,0.5,0.5])

subplot(4,5,14)
plot(1:150,stmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stmat(ist3,:)','color',[0.9,0.5,0.5])


subplot(4,5,15)
plot(stmat(:,:)',srmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(stmat(ist3,:)',srmat(ist3,:)','color',[0.9,0.5,0.5])
title('abrupt4xCO2')

[a b]=sort((abs(stmat(:,150)'-6)))
isb3=b(1:50);

subplot(4,5,16)
plot(tim21,tomat85(:,:)','color',[0.5,.5,0.5])
hold on

plot(tim21,tomat85(isb3,:)','color',[0.9,0.5,0.5])
xlim([1950,2150])
subplot(4,5,17)
plot(tim3000,tomat26(:,:)','color',[0.5,.5,0.5])
hold on
plot(tim3000,tomat26(isb3,:)','color',[0.9,.5,0.5])
xlim([1950,2150])

subplot(4,5,18)
plot(1:150,stcrmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stcrmat(isb3,:)','color',[0.9,0.5,0.5])

subplot(4,5,19)
plot(1:150,stmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(1:150,stmat(isb3,:)','color',[0.9,0.5,0.5])

subplot(4,5,20)
plot(stmat(:,:)',srmat(:,:)','color',[0.5,.5,0.5])
hold on
plot(stmat(isb3,:)',srmat(isb3,:)','color',[0.9,0.5,0.5])
title('abrupt4xCO2')
