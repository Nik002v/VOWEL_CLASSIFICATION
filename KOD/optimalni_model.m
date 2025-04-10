function model_opt = optimalni_model(foldovi, test, hp_kombin,prikaz)
trening_skup = unfold_except(-1,foldovi);
trening_skup_podaci = trening_skup(:,2:9);
trening_skup_labele = trening_skup(:,10);
test_podaci = test(:,2:9);
test_labele = test(:,10);

[~, ~, hp_opt] = podesavanje_hiperparam(foldovi, hp_kombin,prikaz);

template = napravi_sablon({hp_opt});
model_opt = fitcecoc(trening_skup_podaci, trening_skup_labele, "Learners", template);

title1 = 'Matrica konfuzije na trening skupu' ;
title2 = 'Matrica konfuzije na test skupu' ;  
SVMpredict(model_opt,trening_skup_podaci, trening_skup_labele,title1);
SVMpredict(model_opt,test_podaci,test_labele,title2);

end