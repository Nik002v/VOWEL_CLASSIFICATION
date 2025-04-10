function out = unfold_except(i,folds)
out = [];
for ind = 1:length(folds)
    if ind ~= i
        out = [out ; folds{ind}];
    end
end

end