function hp_kombinacije = generisi_kombinacije(tip,C_opseg,k_opseg)

hp_kombinacije = cell(1,length(C_opseg));

for i = 1:length(C_opseg)
    hp_kombinacije{i} = {tip,C_opseg(i),k_opseg(i)};
end
