function isf=issfield(struct,stn)

isf=~isempty(find(cellfun(@(x) ~isempty(strmatch(x,stn)),fieldnames(struct),'UniformOutput',1)));