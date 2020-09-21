function rho=Q1d(d,T,c,p,S0,K)
rho=(log(K./(p-c+S0*exp(-1*d.*T))))./T;
%putBS = K.*exp(-rho*T).*normcdf(-d2)-normcdf(-d1);

% Nishant Agrawal
% This file gives the rho