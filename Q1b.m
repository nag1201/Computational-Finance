function [val,CI] = Q1b(alpha,beta,gamma,rho0,T,Npaths,Nsteps)
rng('default')
rho = Q1a(alpha,beta,gamma,rho0,T,Npaths,Nsteps);
expect = zeros(1,Npaths);
for i = 1:Npaths
    s=0;
    for j = 1:Nsteps
        s = s+ (T/Nsteps)*rho(j,i);
    end
    expect(i)=exp(-1*s);
end
[val,~,CI] = normfit(expect)

% Nishant Agrawal