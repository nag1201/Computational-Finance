function price = priceCall1(paths,K,rho,T)
z=0;
discpayoff = exp(-rho*T)*max(paths(end,:)-K,0);
[z,~,CI] = normfit(discpayoff);
price=z;