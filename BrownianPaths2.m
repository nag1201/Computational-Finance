function paths = BrownianPaths2(T,Nsteps,Npaths)
% simulate the Brownian motion up to time T;
% the number of time steps is Nsteps;
% the number of sample paths is Npaths;

s = (T/Nsteps)^.5;
incr(1,:) = zeros(1,Npaths);
incr(2:Nsteps+1,:) = s*randn(Nsteps,Npaths);
paths = cumsum(incr);
plot(0:T/Nsteps:T,paths)
% using cumsum avoids the double for-loop;
% cumsum adds the values in each column together 