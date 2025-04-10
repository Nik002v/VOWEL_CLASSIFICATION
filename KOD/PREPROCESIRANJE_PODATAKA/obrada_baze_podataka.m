function db = obrada_baze_podataka(pakovanja,Wd,prikazi)
k = 1;
db = cell(1, 10*length(pakovanja));

for i = 1:length(pakovanja)
    pack = pakovanja{i}.data;
    fs = racunaj_fs(i);
    Wn = [100 Wd]/(fs/2); 
    if i == 25 
        deb = 1;
    end
    [poceci,krajevi] = obrada_instanci_vokala(pack, fs, Wn);
    
    if prikazi == 1
        prikaz_obrade(pack,poceci,krajevi)
    end
    
    for j = 1:length(poceci)
        db{k}.data = pack(poceci(j):krajevi(j));
        db{k}.label = pakovanja{i}.label;
        k = k+1;
    end 
end


end