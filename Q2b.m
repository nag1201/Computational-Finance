function A=Q2b(vp,rT,m,cov)
w=Q2a(vp,rT,m);
A=w*cov*(w');

%Nishant Agrawal
% THis file calculates the variance for a given n-2 length weight vector and n
% length of m vector along with n cross n covariance matrix

