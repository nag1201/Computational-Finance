function Ssample = GeoBMPaths2(S0,nu,sigma,T,Nsteps,Npaths)
% simulate geometric Brownian motion up to time T;
% use vectorization and the function cumprod

s = sigma*(T/Nsteps)^.5;
n = nu*T/Nsteps;
incr(1,1:Npaths) = S0;
incr(2:Nsteps+1,:) = exp(n+s*randn(Nsteps,Npaths));
Ssample = cumprod(incr);
plot(0:T/Nsteps:T,Ssample)
title('sample paths of geometric Brownian motion','fontsize',14);
ylabel('value of sampled geometric Brownian motion','fontsize',14);
set(gca,'fontsize',14,'FontWeight','bold'); 
xlabel('time','fontsize',14);