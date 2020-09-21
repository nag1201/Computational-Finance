function [price,CI] = priceCall1AS(paths1,paths2,K,rho,T)
discpayoff1 = exp(-rho*T)*max(paths1(end,:)-K,0);
discpayoff2 = exp(-rho*T)*max(paths2(end,:)-K,0);
[price,~,CI] = normfit((discpayoff1+discpayoff2)/2);