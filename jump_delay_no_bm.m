%%% This program helps in simulating path for models with jumps and no brownian motion. The underlying distribution for jumps is assymetric double exponential jump process.


function path=jump_delay(p,q,eta,phi,Nsteps,lambda,Npaths,T,S0,delay_fac,alpha)
    
n=zeros(Nsteps+1,Npaths);
for k=1:Npaths
    for i=1:Nsteps+1
        n(i,k)=poissrnd(lambda*i*(T/Nsteps));
    end
end
function y = sigma(S0,x)
        y=.15*sin(x/S0 );%  .0224-.0222*x/S0);
    end
path=zeros(1,Npaths);
path(1,:)=S0;
    if delay_fac>Nsteps
        delay_fac=0;
    else
        delay_fac=delay_fac;
    end
for k = 1:Npaths
    for j=1:Nsteps
        if j<=(delay_fac)
            path(j+1,k)=path(j,k)*(1 + .15*doubleexpo1(p,q,eta,phi,n(j+1,k)))*exp((alpha-1*lambda*.2)*T/Nsteps);
        else
            path(j+1,k)= path(j,k)*(1 + sigma(S0,path(j-floor(delay_fac),k))*doubleexpo1(p,q,eta,phi,n(j+1,k)))*exp((alpha-1*lambda*sigma(S0,path(j-floor(delay_fac),k)))*T/Nsteps);
        end
    end
end

plot(0:T/Nsteps:T,path)
end
%%
% the program works well with the given values (0.6,0.4,1.15,0.8,1000,1,15,30,4,40) basically we would input our alpha around 1.15-1.22 
% jump_delay(0.6,0.4,30.22,20.84,390*60,.01,20,1,100,390) gives paths
% jump_delay(0.6,0.4,17.22,15.84,390,1,20,1,100,30) gives paths
