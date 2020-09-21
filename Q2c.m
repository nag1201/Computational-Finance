function vec= Q2c(rT,m,cov)
v0=zeros(1,length(m)-2);
%vp=[]
vec=fminsearch(@(vp)Q2b(vp,rT,m,cov),v0);

%function v=assign2q2c(rT,m,cov)
%vp=zeros(length(m)-2,1)
%fun=@(vp)q2b(vp,rT,m,cov);
%v0=zeros(length(vp),1);
%fminsearch(fun,v0);
%assign2q2anew(vp,rT,m)

%Nishant Agrawal
% This file gives optimal portfolio of length n-2 when m of length n and
% covariance matrix of n cross n is given. Using 1a we can get all the n
% weights.