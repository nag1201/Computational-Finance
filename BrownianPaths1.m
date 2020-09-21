function paths = BrownianPaths1(T,Nsteps,Npaths)
% simulate the Brownian motion up to time T;
% the number of time steps is Nsteps; 
% the number of sample paths is Npaths;

s = (T/Nsteps)^.5;
paths = zeros(Nsteps+1,Npaths);

for i=1:Npaths
    for j=1:Nsteps
        paths(j+1,i) = paths(j,i) + s*randn;
    end
    % inner for-loop is to sample path number i
end
% outer for-loop is for the different paths;
% "paths" is a matrix which contains in each column a sample of the Brownian motion
plot(0:T/Nsteps:T,paths)
title('sample paths of Brownian motion','fontsize',14);
ylabel('value of sampled Brownian motion','fontsize',14);
set(gca,'fontsize',14,'FontWeight','bold'); 
xlabel('time','fontsize',14);