S0 = 3317;
k = 3350;
d = .0185;
T=90;
c=61;
p=96;
intr=Q1d(d,T,c,p,S0,k);
intr
% we get the interest as 1.8 percent
cimpv=blsimpv(S0,k,intr,T,c)
% implied volatility on call option is 8.9 percent
pimpv=blsimpv(S0,k,intr,T,p)
% implied volatility on call option is 9.6 percent

% Nishant Agrawal
