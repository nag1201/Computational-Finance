function Ssample = Q2b2(S0,mu,T,Nsteps,Npaths)
rng('default')
    function y = sigma(S0,x,T)
        y=exp(-7*T)*max(1.2*x/S0 - 1.18 , 2.24-2.22*x/S0)+(1-exp(-7*T))*.22;
    end
L = T/Nsteps;
Ls = L^.5;
Ssample = zeros(Nsteps+1,Npaths);
Ssample(1,:) = S0;
for i=1:Npaths
    for j=1:Nsteps
     Ssample(j+1,i) = Ssample(j,i)*exp((mu-(sigma(S0,Ssample(j,i),T))^2/2)*L + sigma(S0,Ssample(j,i),T)*Ls*randn);
    end
end
end
