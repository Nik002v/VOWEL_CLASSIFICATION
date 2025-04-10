function labele_pred = SVMpredict(svm,podaci,labele,naslov) % podaci obelezja po vrstama 

labele_pred = predict(svm, podaci);

cm = confusionmat(labele,labele_pred);
tacnost = trace(cm)/size(podaci,1);

figure; confusionchart(cm) ; 
title([naslov,' (Acc = ',num2str(100*tacnost),'%)']);

end