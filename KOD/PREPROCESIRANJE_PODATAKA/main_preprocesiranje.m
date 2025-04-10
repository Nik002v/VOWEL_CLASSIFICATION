clear; close all; clc;

%% UCITAVANJE SIROVIH PODATAKA

broj_kandidata = 10;
broj_vokala = 5;
mapa_vokala = ['a','e','i','o','u'];
mapa_imena = {'Lara','Jasmina','Isidora','Marija','Nikolina','Nikola','Nika','Neca','Nemanja','Aleksa'};
put = 'C:\Users\HP\Desktop\PROJEKTI\DIPLOMSKI\BAZA_PODATAKA\ORIGINALNE_SEKVENCE\';
pakovanja = cell(1, broj_kandidata*broj_vokala);
ind = 1;

for i = 1:broj_kandidata
    kandidat = mapa_imena{i};
    ime_foldera = append(put, kandidat,' wav\');
    
    for j = 1:broj_vokala
        pun_put = append(ime_foldera, mapa_vokala(j), num2str(1), '.wav');
        [signal, fs] = audioread(pun_put); 
        pakovanja{ind}.data = signal(:,1);
        pakovanja{ind}.label = j;
        ind = ind + 1;
    end
end

%% DOWNSAMPLE SEKVENCI NA 12 kHz

for i = 1:length(pakovanja)
    pakovanja{i}.data = resample(pakovanja{i}.data, racunaj_fs(i), fs);
end

%% OBRADA BAZE PODATAKA i PRIKAZ REZULTATA

Wd = 4000; % granicna frekvencija filtra u Hz
prikaz = 1 ; % 1 : za prikaz grafika

baza_podataka = obrada_baze_podataka(pakovanja, Wd, prikaz);
save("sekvence.mat", "baza_podataka")
