clear; close all; clc;

%% UCITAVANJE BAZE PODATAKA POSLE PREDOBRADE

baza_podataka =  load('sekvence.mat').baza_podataka;

%% PRIKAZ KARAKTERISTICNIH TALASA I SPEKTARA SNAGE ZA SVAKI VOKAL

figure;
hold all;
subplot(3,2,1)
plot(baza_podataka{1}.data); xlabel('n');title('Akusticki talas vokala A')
subplot(3,2,2)
plot(baza_podataka{101}.data); xlabel('n');title('Akusticki talas vokala E')
subplot(3,2,3)
plot(baza_podataka{201}.data); xlabel('n');title('Akusticki talas vokala I')
subplot(3,2,4)
plot(baza_podataka{301}.data); xlabel('n');title('Akusticki talas vokala O')
subplot(3,2,5)
plot(baza_podataka{401}.data); xlabel('n');title('Akusticki talas vokala U')

fs_signala = 11025;
broj_tacaka = 2^12;
red_modela = 8;

figure;
hold all;
subplot(3,2,1)
pmcov(baza_podataka{33}.data,red_modela,broj_tacaka,fs_signala); title('SGS reda 8 vokala A')
subplot(3,2,2)
pmcov(baza_podataka{142}.data,red_modela,broj_tacaka,fs_signala); title('SGS reda 8 vokala E')
subplot(3,2,3)
pmcov(baza_podataka{226}.data,red_modela,broj_tacaka,fs_signala);title('SGS reda 8 vokala I')
subplot(3,2,4)
pmcov(baza_podataka{385}.data,red_modela,broj_tacaka,fs_signala); title('SGS reda 8 vokala O')
subplot(3,2,5)
pmcov(baza_podataka{426}.data,red_modela,broj_tacaka,fs_signala); title('SGS reda 8 vokala U')

%% EKSTRAKCIJA OBELEZJA (LPC koeficijenti)

p = 8;
obelezja = [];
labele = [];

for i = 1:length(baza_podataka)
    instanca = baza_podataka{i}.data;
    win = length(instanca)-1;
    obelezja = [obelezja, feature_extraction(instanca,win,p)];
    labele = [labele, baza_podataka{i}.label];
end
obelezja_labele = [obelezja' labele'];

%% VIZUELIZACIJA OBELEZJA

figure;
colors = {'r.','g.','b.','m.','k.'};
for i = 1:length(obelezja_labele)
    hold all
    marker = colors{obelezja_labele(i,end)};
    plot3(obelezja_labele(i,2),obelezja_labele(i,3),obelezja_labele(i,4),marker);
    title('Prva tri LPC koeficijenta (obelezja) za svaku sekvencu')
    xlabel('LPC_2');ylabel('LPC_3');zlabel('LPC_4');
end
legend('a = red','e = green','i = blue','o = magenta','u = black')

%% PODELA SKUPA OBELEZJA NA FOLDOVE, TRENING I TEST SKUP (MATRICE)
rng(10)
k = 5;
test_size = 0.2;

[foldovi,test] = podela_KFolds_test(obelezja_labele,k,test_size);

%% TRAZENJE HIPERPARAMETARA

prikaz = 1;
broj_kombinacija = 100;

% linearni kernel
tip = 1;
k_opseg = zeros(1,broj_kombinacija);
% C_opseg = logspace(-1,5,broj_kombinacija);
% C_opseg = linspace(3e3,17e3,broj_kombinacija);
C_opseg = linspace(8e3,10e3,broj_kombinacija);
hp_kombin = generisi_kombinacije(tip,C_opseg,k_opseg);

model_opt1 = optimalni_model(foldovi,test, hp_kombin, prikaz);

% polinomijalni kernel
tip = 2;
k_opseg = 3 * ones(1,broj_kombinacija); 
%C_opseg = logspace(-1,5,broj_kombinacija);
C_opseg = logspace(0,1,broj_kombinacija);
hp_kombin = generisi_kombinacije(tip,C_opseg,k_opseg);

model_opt2 = optimalni_model(foldovi,test, hp_kombin, prikaz);

% Gausov kernel
tip = 3;
k_opseg = 0.6 * ones(1,broj_kombinacija);
%C_opseg = logspace(-1,5,broj_kombinacija);
C_opseg = linspace(1,10,broj_kombinacija);
hp_kombin = generisi_kombinacije(tip,C_opseg,k_opseg);

model_opt3 = optimalni_model(foldovi,test, hp_kombin, prikaz);



