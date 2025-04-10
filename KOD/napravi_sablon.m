function t = napravi_sablon(hp)
tip = hp{1}{1};
C = hp{1}{2};

if tip == 3
    gama = 1/sqrt(hp{1}{3});
    t = templateSVM("KernelFunction", 'gaussian',"BoxConstraint",C,"Type", "classification","KernelScale",gama);
end

if tip == 2
    stepen = hp{1}{3};
    t = templateSVM("KernelFunction", 'polynomial',"BoxConstraint",C,"Type", "classification","PolynomialOrder",stepen);
end

if tip == 1
    t = templateSVM("KernelFunction", 'linear',"BoxConstraint",C,"Type", "classification" );
end

end