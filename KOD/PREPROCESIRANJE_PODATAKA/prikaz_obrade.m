function [] = prikaz_obrade(x,poceci,krajevi)
h = max(x);
figure(); hold all;
plot(x)
for i = 1:length(poceci)
    plot([poceci(i), poceci(i)],[0,h],'r','LineWidth',1.2)
    plot([krajevi(i), krajevi(i)],[0,h],'r', 'LineWidth',1.2)
end
title('Finalni prikaz izvrsene segmentacije-filtriran govorni signal i izdvojene sekvence')
xlabel('n');

end