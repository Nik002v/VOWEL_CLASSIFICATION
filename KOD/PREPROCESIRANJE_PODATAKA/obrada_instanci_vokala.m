function [poceci,krajevi] = obrada_instanci_vokala(x,fs,Wn)

[B,A]=butter(6,Wn,'bandpass');
x_f = filter(B,A,x);

x = x_f;

windowDuration = 0.070; % seconds
numWindowSamples = round(windowDuration*fs);
win = hamming(numWindowSamples,'periodic');

percentOverlap = 35;
overlap = round(numWindowSamples*percentOverlap/100);

mergeDuration = 0.35; % seconds
mergeDist = round(mergeDuration*fs);

inds = detectSpeech(x,fs,"Window",win,"OverlapLength",overlap,"MergeDistance",mergeDist);
poceci = inds(:,1);
krajevi = inds(:,2);

end