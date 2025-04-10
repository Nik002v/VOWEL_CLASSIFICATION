function [foldovi,test]= podela_KFolds_test(obelezja,k,test_size)

[m,~] = size(obelezja);
obelezja = obelezja(randperm(m),:); % shuffle
Ntest = floor(test_size * m);
Nrest = m - Ntest;

datarest = obelezja(1:Nrest, :);
test = obelezja(Nrest+1 : m, :);

Nfold = floor(Nrest/k);
foldovi = cell(1,k);
for i = 0:k-1
    fold = datarest(i*Nfold+1 : (i+1)*Nfold, :);
    foldovi{i+1} = fold;
end

end