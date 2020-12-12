K=210.0:5.0:215.0;
prices=zeros(length(K),3);
%prices(length(K),1)=K;
for j = 1:length(K)
    %paths=GeoBMPaths2(209.11,.11,.15,6/12,6.5*60*22*6,200);
    %GeoBMPaths2(S0,nu,sigma,T,Nsteps,Npaths)
    %prices(j,1)=priceCall1(paths,K(j),.01,6/12);
    %prices(j,1)=Call_p_j_no_bm(0.60,0.40,12.8,8.40,2*6.5*60*22*6,.03,150,6/12,209.11,60*6.5,.11,.01,K(j));
    %prices(j,2)=Call_p_j_no_bm(0.60,0.40,12.8,8.40,4*6.5*60*22*6,.03,150,6/12,209.11,60*6.5,.11,.01,K(j));
    prices(j,3)=Call_p_j_no_bm(0.60,0.40,12.8,8.40,8*6.5*60*22*6,.03,150,6/12,209.11,60*6.5,.11,.01,K(j));
    %Call_p_j_no_bm(p,q,eta,phi,Nsteps,lambda,Npaths,T,S0,delay_fac,alpha,rho,K)
end
prices