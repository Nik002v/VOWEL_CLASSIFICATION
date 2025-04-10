function fs_new = racunaj_fs(i)

spec_vrednosti = 6:10; % Jasmina - 11025, ostali 12000
indikator = sum(i == spec_vrednosti);

if indikator == 1
    fs_new = 11025;
else
    fs_new = 12000;
end


end