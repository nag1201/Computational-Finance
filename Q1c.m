function ssq =Q1c(parameters)
dataQ1A4
rng('default')
gamma=0;
Npaths=1;
rho0=.015;
T  = 30;
Nsteps = 120; 
rho = Q1a(parameters(1),parameters(2),gamma,rho0,T,Npaths,Nsteps); 
ssq=0;
for j=1:120
   ssq = ssq+ ( Rates(j,2) - rho(j+1) )^2 ;
end


% Nishant Agrawal