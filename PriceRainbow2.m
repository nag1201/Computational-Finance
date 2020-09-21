function [price,CI] = PriceRainbow2(sigma,alpha,T,S0,X0,K1,K2,k,rho)
rng('default');
l=randn(1,k);
m=randn(1,k);
ST=S0*exp(((-1)*(sigma^2)*T/2)+sigma*(sqrt(T))*l);
XT=X0*exp(((-1)*(alpha^2)*T/2)+alpha*(sqrt(T))*(rho*l+sqrt(1-rho^2)*m));
discpayoff=zeros(1,k);
discpayoff(ST>K1 & K2>XT)=ST(ST>K1 & K2>XT)-K1;
discpayoff(ST<K1 & K2<XT)=XT(ST<K1 & K2<XT)-K2;
discpayoff(ST>K1 & K2<XT)=max(ST(ST>K1 & K2<XT)-K1,XT(ST>K1 & K2<XT)-K2);
discpayoff(ST<K1 & K2>XT)=0;
[price,~, CI]=normfit(discpayoff)
% price=mean(discpayoff);
% Nishant Agrawal
% The price comes out to be 660.3476 and CI [638.1238,682.5715]