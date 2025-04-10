function [loss_val, acc_val, hp_opt] = podesavanje_hiperparam(foldovi, hp_kombin,prikaz)

loss_val = [];
acc_val = [];

fn_acc = @(x,y) sum(x == y)/length(y);

for hp = hp_kombin
    template = napravi_sablon(hp);
    loss_val_skup = [];
    acc_val_skup = [];
    
    for i = 1:length(foldovi)
        validacioni_split = foldovi{i};
        trening_split = unfold_except(i,foldovi);
        
        model = fitcecoc(trening_split(:,2:9), trening_split(:,10), "Learners", template);
    
        loss_val_split = loss(model, validacioni_split(:,2:9),validacioni_split(:,10));
        acc_val_split = fn_acc(predict(model, validacioni_split(:,2:9)),validacioni_split(:,10));
    
        loss_val_skup = [loss_val_skup, loss_val_split];
        acc_val_skup = [acc_val_skup, acc_val_split];
        
    end
    loss_val = [loss_val, median(loss_val_skup)];
    acc_val = [acc_val, median(acc_val_skup)];
end

if prikaz == 1
    figure;
    subplot(2,1,1)
    plot(loss_val)
    title('Los fja na validacionom skupu za kombinacije hp-ova')
    xlabel('i-ta kombinacija'); ylabel('loss');
    subplot(2,1,2)
    plot(acc_val)
    title('Tacnost na validacionom skupu za kombinacije hp-ova')
    xlabel('i-ta kombinacija'); ylabel('tacnost');
end

[~,ind_opt] = max(acc_val);
hp_opt = hp_kombin{ind_opt};

end