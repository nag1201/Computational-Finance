function [pr, CI] = PriceRainbow1(sigma,alpha,T,S0,X0,K1,K2,k)
rng('default');
ST=S0*exp(((-1)*(sigma^2)*T/2)+sigma*(sqrt(T))*randn(1,k));
XT=X0*exp(((-1)*(alpha^2)*T/2)+alpha*(sqrt(T))*randn(1,k));
discpayoff=zeros(1,k);
discpayoff(ST>K1 & K2>XT)=ST(ST>K1 & K2>XT)-K1;
discpayoff(ST<K1 & K2<XT)=XT(ST<K1 & K2<XT)-K2;
discpayoff(ST>K1 & K2<XT)=max(ST(ST>K1 & K2<XT)-K1,XT(ST>K1 & K2<XT)-K2);
discpayoff(ST<K1 & K2>XT)=0;
[pr,~,CI]=normfit(discpayoff)

% Nishant Agrawal
% The implied volatility calculated using 
% blsimpv(9624,10000,0,3.5/12,197)and blsimpv(29398,30000,0,3.5/12,633) 
% comes out to be 0.1674 and 0.1410.
% We get the price of the option as 753.1447 and CI as [731.1413,778.1482]



