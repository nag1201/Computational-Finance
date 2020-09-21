function v = Q2a(vp,rT,m)
syms wn1 wn;
A=[1 1;m(end-1) m(end)];
w=[wn1; wn];
M=m(1:length(m)-2);
R=vp.*M;
B=[1-sum(vp);rT-sum(R)];
w=A\B;
v=[];
v=[vp w'];

% Nishant Agrawal
% This file on inputing weight vector of length n-2 along with one rT value and m vector of length n gives out weight vector
% of length n