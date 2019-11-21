function ens=read_gm(recalc)
 if nargin<1
     recalc=0;
 end
     
if recalc
    %    datadir='/scratch/globc/sanderson/cmip5-ng/

    datadir='/data/cmip5-ng';

fields={'rlut','rlutcs','rsut','rsutcs','tas'};
mdlf={};
runs={};
for i=1:numel(fields)
fl=dir([datadir '/' fields{i} '/*.nc']);
for j=1:numel(fl)
fn=strsplit(fl(j).name,'_');
mdlf=unique([mdlf,fn{3}]);
runs=unique([runs,fn{4}]);
end
end
%runs{1}='onepct';
runn=runs;
runn{1}='onepctCO2'
%mdls{7}='CESM1-CAM5'

%%PICTRL
for i=1:numel(fields)
    
for j=1:numel(mdlf)
    
for jj=1:numel(runs)
    
    fil_run=dir([datadir '/' fields{i} '/' fields{i} '_ann_' mdlf{j} '_' runs{jj} '*_g025.nc']);
for k=1:numel(fil_run) 

    vb=ncread([datadir '/' fields{i} '/' fil_run(k).name],fields{i});
vt=ncread([datadir '/' fields{i} '/' fil_run(k).name],'year');
units=ncreadatt([datadir '/' fields{i} '/' fil_run(k).name], ...
                'year','units');
basedate=datenum(regexprep(regexprep(units,'.*ince ',''),' .*',''));
dtv=datevec(vt+basedate);

lats=ncread([datadir '/' fields{i} '/' fil_run(k).name],'lat');
mdl=strrep(mdlf{j},'-','_');
%ens(j).mdl=mdls{j};
ens.(mdl).(runn{jj}).(fields{i}){k}(:,:)= ...
    squeeze(latmean((nanmean(vb,1)),lats,2));
ens.(mdl).(runn{jj}).year{k}= ...
    dtv(:,1);
end
end
end
end

[tim fcg_85 fcg_pd]=read_forcing('RCP85');
[tim fcg_45 fcg_pd]=read_forcing('RCP45');
[tim fcg_26 fcg_pd]=read_forcing('RCP3PD');

emis=read_c4mip;
mdle=fieldnames(emis);
mdls=fieldnames(ens);
clear mdlf
for i=1:numel(mdls)
    mdlf{i}=strrep(mdls{i},'_','-');
end

for i=1:numel(mdle)
    runs=fieldnames(emis.(mdle{i}));
    for j=1:numel(runs)
        if ~isempty(find(cellfun(@(x) ~isempty(strfind(x,runs{j})),fieldnames(ens.(mdle{i})))))
    ens.(mdle{i}).(runs{j}).emis=interp1(emis.(mdle{i}).(runs{j}).year, ...
                               emis.(mdle{i}).(runs{j}).CompEmis, ...
                               ens.(mdle{i}).(runs{j}).year{1});
    ens.(mdle{i}).(runs{j}).c_ocn=interp1(emis.(mdle{i}).(runs{j}).year, ...
                               emis.(mdle{i}).(runs{j}).cOcn, ...
                               ens.(mdle{i}).(runs{j}).year{1});
     ens.(mdle{i}).(runs{j}).c_land=interp1(emis.(mdle{i}).(runs{j}).year, ...
                               emis.(mdle{i}).(runs{j}).cL_tot, ...
                               ens.(mdle{i}).(runs{j}).year{1}); ...
         
         end
    end
end

for i=1:numel(mdlf)
[temis ttas]=read_tcr(mdlf{i});
[semis stas]=read_ecs(mdlf{i});
if ~isnan(temis(1))
      if ~isempty(find(cellfun(@(x) ~isempty(strfind(x,'onepctCO2')),fieldnames(ens.(mdls{i})))))
    ens.(mdls{i}).onepctCO2.emis= ens.(mdls{i}).onepctCO2.tas{1}*NaN;
      else
              ens.(mdls{i}).onepctCO2.tas{1}=ttas;
      end
      

    nt=numel( ens.(mdls{i}).onepctCO2.tas{1}*NaN);
    ne=numel(temis);
    ens.(mdls{i}).onepctCO2.emis(1:min(nt,ne))=temis(1:min(nt,ne));
    ens.(mdls{i}).onepctCO2.ppmv(1:min(nt,ne))=280*1.01.^(1:min(nt,ne));
    ens.(mdls{i}).onepctCO2.c_atm=(ens.(mdls{i}).onepctCO2.ppmv-ens.(mdls{i}).onepctCO2.ppmv(1))*2.12;

end
if ~isnan(semis(1))
          if ~isempty(find(cellfun(@(x) ~isempty(strfind(x,'abrupt4xCO2')),fieldnames(ens.(mdls{i})))))
    ens.(mdls{i}).abrupt4xCO2.emis=ens.(mdls{i}).abrupt4xCO2.tas{1}* ...
        NaN;
          else 
              ens.(mdls{i}).abrupt4xCO2.tas{1}=stas;
          end
          
              
    nt=numel(ens.(mdls{i}).onepctCO2.tas{1}*NaN);
    ne=numel(semis);
    ens.(mdls{i}).abrupt4xCO2.emis(1:min(nt,ne))=semis(1:min(nt,ne));
    ens.(mdls{i}).abrupt4xCO2.ppmv(1:min(nt,ne))=280*[4* ...
                        ones([min(nt,ne)],1)];
    
    ens.(mdls{i}).abrupt4xCO2.c_atm=(ens.(mdls{i}).abrupt4xCO2.ppmv/4*3)*2.12;

end
end


[a tmp]=xlsread('rcp_ppm.xlsx')

ppmy=a(1,:);
truns={'rcp60','rcp45','rcp26','rcp85'}

for i=1:numel(mdls)
   for j=1:numel(truns)
               if ~isempty(find(cellfun(@(x) ~isempty(strfind(x,truns{j})),fieldnames(ens.(mdls{i})))))
  ens.(mdls{i}).(truns{j}).ppmv=interp1(ppmy,a(1+j,:), ...
                                        ens.(mdls{i}).(truns{j}).year{1});
     ens.(mdls{i}).(truns{j}).c_atm=   (ens.(mdls{i}).(truns{j}).ppmv-ens.(mdls{i}).(truns{j}).ppmv(1))*2.12;
  end
   end
end
save('ens.mat','ens')
else 
    load('ens.mat')
end
