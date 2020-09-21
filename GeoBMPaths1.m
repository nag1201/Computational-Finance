function Ssample = GeoBMPaths1(S0,nu,sigma,T,Nsteps,Npaths)
% simulate geometric Brownian motion up to time T;

Wsample = BrownianPaths2(T,Nsteps,Npaths);
t = repmat((0:T/Nsteps:T)',1,Npaths);
% repmat creates a matrix with 0:T/NSteps:T in each column; alternatively, one can use t = (0:T/NSteps:T)'*ones(1,Npaths)
Ssample = S0*exp(nu*t + sigma*Wsample);
plot(0:T/Nsteps:T,Ssample)
title('sample paths of geometric Brownian motion','fontsize',14);
ylabel('value of sampled geometric Brownian motion','fontsize',14);
set(gca,'fontsize',14,'FontWeight','bold'); 
xlabel('time','fontsize',14);