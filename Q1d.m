%% 1d
Npaths=100;
rho0=.015;
T  = 30;
Nsteps = 120; 
v0 = [1,0.01];
[x,b] = fminsearch(@Q1c,v0)
gamma=sqrt(b/Nsteps);
Q1b(x(1),x(2),gamma,rho0,T,Npaths,Nsteps)


% *(i)* We get the values of alpha = .5878 and beta = 0.0148.
% *(ii)* Using the values which we get in the first part the price comes
% out to be  0.6390 with confidence 95% confidence interval as [0.6383,0.6397]
% 