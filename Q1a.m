function paths = Q1a(alpha,beta,gamma,rho0,T,Npaths,Nsteps)
rng('default')

paths=zeros(Nsteps+1,Npaths);

paths(1,:)=rho0;

for i=1:Npaths
    for j=2:Nsteps+1
        paths(j,i) = paths(j-1,i)+ alpha*(beta - paths(j-1,i))*(T/Nsteps)+ gamma*randn*sqrt(T/Nsteps);
    end
end
end
%plot(paths)

% Nishant Agrawal
        
    