rtn_evt=cellfun(@(x) sprintf('%2.0f',x),num2cell(round(1./(1- ...
                                                  c_prctl)*40,2,'significant')),'UniformOutput',0);
for i=1:numel(rtn_evt)
   if str2num(rtn_evt{i})>5000
       rtn_evt{i}='>5000';
   end
end



lbl=cellstr([repmat('(',numel(regnm),1),(char(96+(1:numel(regnm))')),repmat(')',numel(regnm),1)])';
input.data= [lbl;cellfun(@(x) strjoin(x),regnm,'UniformOutput',0);city; ...
            state;evt_date;cellfun(@(x) sprintf('%0.0f',x),num2cell(c_lvl),'UniformOutput',0);rtn_evt]';
input.dataFormat = {'%s',7};
  input.dataNanString = '-';
   input.tableColumnAlignment = 'l';
   input.tableBorders = 1;
   input.booktabs = 1;
   input.tableCaption = ['A table showing the most extreme 3 day ' ...
                       'precipitation event in each cluster region ' ...
                       'in the GPCC dataset during the 1988-2013 ' ...
                       'period, together with return periods estimated ' ...
                       'from the present analysis'];
   input.tableLabel = 'Pevents';
   input.makeCompleteLatexDocument = 0;
  input.tableColLabels = {'','Region','Town','State','Date',['3day mm ' ...
                      'total'],'Rtn Period (years)'};
    input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'column' is used

latexTable(input);

input2.data= [mdl',cellfun(@(x) [strrep(sprintf('%d',x-20),'NaN','-') '-' strrep(sprintf('%d',x+19),'NaN','-')] ,num2cell(erng),'UniformOutput',0)];
input2.dataFormat = {'%s',6};
  input2.dataNanString = '-';
   input2.tableColumnAlignment = 'l';
   input2.tableBorders = 1;
   input2.booktabs = 1;
   input2.tableCaption = ['A table showing the CMIP5 models used in ' ...
                       'the analysis and  the years used to represent ' ...
                       'each threshold temperature level'];
   input2.tableLabel = 'Pmodels';
   input2.makeCompleteLatexDocument = 0;
  input2.tableColLabels = {'Model','1$^\circ$C warming','1.5$^\circ$C','2.0$^\circ$C','3.0$^\circ$C','4.0$^\circ$C'};
    input2.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'column' is used
latexTable(input2);

input3.data= [lbl;cellfun(@(x) strjoin(x),regnm,'UniformOutput',0);cellfun(@(x) sprintf('%0.0f',x),num2cell(p_rtn_1000_al'),'UniformOutput',0) ]';
input3.dataFormat = {'%s',7};
  input3.dataNanString = '-';
   input3.tableColumnAlignment = 'l';
   input3.tableBorders = 1;
   input3.booktabs = 1;
   input3.tableCaption = ['A table showing maximum liklihood for ' ...
                       'return periods of present day 1000 year ' ...
                       'events at different warming thresholds.  ' ...
                       'Data corresponds to dashed line in Figure ' ...
                       '2, representing the mean of the subset of ' ...
                       'models which reach 4 degrees C warming ' ...
                       'during the RCP8.5 simulation'];
   input3.tableLabel = 'Pmodels';
   input3.makeCompleteLatexDocument = 0;
  input3.tableColLabels = {'','Region','Present','1.5$^\circ$C','2.0$^\circ$C','3.0$^\circ$C','4.0$^\circ$C'};
    input3.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'column' is used
latexTable(input3);

in_99=cellfun(@(x) sprintf('%0.0f',x),num2cell(out99),'UniformOutput',0);
for i=1:size(out99,1)
    for j=1:size(out99,2)
        rtn_in{i,j}=strjoin(in_99(i,j,1:2),'/');
       rtn_act{i,j}=in_99{i,j,4};
    end
end

input4.data= [lbl;cellfun(@(x)  strjoin(x),regnm,'UniformOutput',0);rtn_in]';
input4.dataFormat = {'%s',7};
  input4.dataNanString = '-';
   input4.tableColumnAlignment = 'l';
   input4.tableBorders = 1;
   input4.booktabs = 1;
   input4.tableCaption = ['A table showing 3 day precipitation ' ...
                       'levels for 100/1000 year events at ' ...
                       'different warming levels in mm.  Values ' ...
                       'correspond to Figure 4'];
   input4.tableLabel = 'Pmodels';
   input4.makeCompleteLatexDocument = 0;
  input4.tableColLabels = {'','Region','Present','1.5$^\circ$C','2.0$^\circ$C','3.0$^\circ$C','4.0$^\circ$C'};
    input4.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'column' is used
latexTable(input4);

p_rtn0=cellfun(@(x) sprintf('%0.0f',x),num2cell(p_rtn'),'UniformOutput',0);
for i=1:numel(p_rtn0)
   if str2num(p_rtn0{i})>5000
       p_rtn0{i}='>5000';
   end
end

input3.data= [lbl;cellfun(@(x) strjoin(x),regnm,'UniformOutput',0);p_rtn0]';
input3.dataFormat = {'%s',7};
  input3.dataNanString = '-';
   input3.tableColumnAlignment = 'l';
   input3.tableBorders = 1;
   input3.booktabs = 1;
   input3.tableCaption = ['A table showing maximum liklihood for ' ...
                       'return periods of the observed extreme events in table 1 at different warming thresholds.  ' ...
                       'Data corresponds to dashed green line in Figure ' ...
                       '2, representing the mean of the subset of ' ...
                       'models which reach 4 degrees C warming ' ...
                       'during the RCP8.5 simulation'];
   input3.tableLabel = 'Pmodels_obs';
   input3.makeCompleteLatexDocument = 0;
  input3.tableColLabels = {'','Region','Present','1.5$^\circ$C','2.0$^\circ$C','3.0$^\circ$C','4.0$^\circ$C'};
    input3.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'column' is used
latexTable(input3);
