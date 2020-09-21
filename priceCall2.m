function [price,CI] = priceCall2(paths,K,rho,T)

halftime = (size(paths,1)-1)/2+1;
% halftime gives the number after half of the NSteps, assuming NSteps is even; if NSteps could also be odd, we would use an if-condition or rounding of the form by using floor(size(paths,1)/2)+1;
discpayoff = exp(-rho*T)*max(max(paths(end,:)-K,...
    paths(halftime,:)-K),0);
[price,~,CI] = normfit(discpayoff);