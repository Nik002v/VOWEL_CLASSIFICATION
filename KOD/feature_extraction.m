function LPC = feature_extraction(x_pr,win,p) 
x = x_pr;
N = length(x);
num = floor(N/win); 
LPC = zeros(p+1,num);

k = 1;
for i = 1:win:N-win
    xw = x(i:i+win-1);
    [a,~] = armcov(xw,p);
    LPC(:,k) = a';
    k = k + 1;
end
    
end