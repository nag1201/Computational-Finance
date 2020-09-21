function Ssample = Q2b1(S0,mu,T,Nsteps,Npaths)
rng('default') 
    function y = sigma(S0,x)
        y= max(.47*x/S0 - .33 , 0.86 - 0.72*x/S0);
    end
L = T/Nsteps;
Ls = L^.5;
Ssample = zeros(Nsteps+1,Npaths);
Ssample(1,:) = S0;
for i=1:Npaths
    for j=1:Nsteps
     Ssample(j+1,i) = Ssample(j,i)*exp((mu-(sigma(S0,Ssample(j,i)))^2/2)*L + sigma(S0,Ssample(j,i))*Ls*randn);
    end
end

end