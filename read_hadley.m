function [gm_had,useyrs,tsmatw_had]=read_hadley()

lats=[-89.5:1:89.5]';
lons=[.5:1:359.5]';
latarray=repmat(lats',size(lons,1),1);
lonarray=repmat(lons,1,size(lats,1));

wgt=repmat(cos(lats/180*pi)',[numel(lons),1]);
wgt=wgt/mean(wgt(:));

t_had=ncread('HadCRUT.4.6.0.0.median.nc','temperature_anomaly');
time_had=double(ncread('HadCRUT.4.6.0.0.median.nc','time'))+ ...
         datenum(1850,1,1);
lon_tmp=ncread('HadCRUT.4.6.0.0.median.nc','longitude');
lon_had=mod((lon_tmp([37:end,1:36]))+360,360);
lon_had=(lon_had-lon_had(1))/lon_had(end)*360;
lat_had=ncread('HadCRUT.4.6.0.0.median.nc','latitude');
lat_had=lat_had*90/87.5;
temp_had=t_had([37:end,1:36],:,:);
[lonharray latharray]=ndgrid(lon_had,lat_had);



for i=1:size(temp_had,3)
    int_had(:,:,i)=inpaint_nans(temp_had(:,:,i),2);
    int2_had(:,:,i)=interpn(lonharray,latharray,int_had(:,:,i),lonarray,latarray);
end
haddv=datevec(time_had);
useyrs=1850:2016;
for i=1:numel(useyrs)
    usetmp=find(haddv(:,1)==useyrs(i));
    tsmat_had(:,:,i)=mean(int2_had(:,:,usetmp),3);
end

tsmatw_had=tsmat_had.*repmat(wgt,[1,1,numel(useyrs)]);
tsmatw_base=mean(tsmatw_had(:,:,1:30),3);
tsmatw_had=tsmatw_had-repmat(tsmatw_base,[1,1,numel(useyrs)]);

gm_had=squeeze(nanmean(nanmean(tsmatw_had,1),2));