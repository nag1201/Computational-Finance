function [price,CI] = PriceRainbow3(sigma,alpha,T,S0,X0,K1,K2,k,rho)
rng('default');
l=randn(1,k);
m= randn(1,k);
ST1=S0*exp(((-1)*(sigma^2)*T/2)+sigma*(sqrt(T))*l);
ST2=S0*exp(((-1)*(sigma^2)*T/2)-sigma*(sqrt(T))*l);

XT1=X0*exp(((-1)*(alpha^2)*T/2)+alpha*(sqrt(T))*(rho*l+sqrt(1-rho^2)*m));
XT2=X0*exp(((-1)*(alpha^2)*T/2)-alpha*(sqrt(T))*(rho*l+sqrt(1-rho^2)*m));


discpayoff1=zeros(1,k);
discpayoff1(ST1>K1 & K2>XT1)=ST1(ST1>K1 & K2>XT1)-K1;
discpayoff1(ST1<K1 & K2<XT1)=XT1(ST1<K1 & K2<XT1)-K2;
discpayoff1(ST1>K1 & K2<XT1)=max(ST1(ST1>K1 & K2<XT1)-K1,XT1(ST1>K1 & K2<XT1)-K2);
discpayoff1(ST1<K1 & K2>XT1)=0;

discpayoff2=zeros(1,k);
discpayoff2(ST2>K1 & K2>XT2)=ST2(ST2>K1 & K2>XT2)-K1;
discpayoff2(ST2<K1 & K2<XT2)=XT2(ST2<K1 & K2<XT2)-K2;
discpayoff2(ST2>K1 & K2<XT2)=max(ST2(ST2>K1 & K2<XT2)-K1, XT2(ST2>K1 & K2<XT2)-K2);
discpayoff2(ST2<K1 & K2>XT2)=0;

discpayoff= (discpayoff1+discpayoff2)/2;
[price,~,CI ]=normfit(discpayoff)

%Nishant Agrawal
% The value comes out to be 