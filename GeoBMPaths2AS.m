function [Ssample1,Ssample2] = GeoBMPaths2AS(S0,nu,sigma,T,Nsteps,Npaths)
% simulate geometric Brownian motion up to time T;
% use antithetic sampling, vectorization and the function cumprod

s = sigma*(T/Nsteps)^.5;
n = nu*T/Nsteps;
N = randn(Nsteps,Npaths);
incr1(1,1:Npaths) = S0;
incr1(2:Nsteps+1,:) = exp(n+s*N);
Ssample1 = cumprod(incr1);
incr2(1,1:Npaths) = S0;
incr2(2:Nsteps+1,:) = exp(n-s*N);
Ssample2 = cumprod(incr2);
plot(0:T/Nsteps:T,Ssample1,0:T/Nsteps:T,Ssample2)
title('sample paths of geometric Brownian motion','fontsize',14);
ylabel('value of sampled geometric Brownian motion','fontsize',14);
set(gca,'fontsize',14,'FontWeight','bold'); 
xlabel('time','fontsize',14);