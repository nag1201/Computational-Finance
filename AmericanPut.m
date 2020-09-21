function value=AmericanPut1(Sn ,u , d, r, K, m)
if m==0
    value=max(K-Sn,0);
else
    qu=(1+r-d)/(u-d);
    qd=1-qu;
    z = (AmericanPut1(Sn*u,u,d,r,K,m-1)*qu + AmericanPut1(Sn*d,u,d,r,K,m-1)*qd)/(1+r);
    %fu=max(max(K-u*Sn,0),AmericanPut(Sn*u,u,d,r,K,m-1));
    %fd=max(max(K-d*Sn,0),AmericanPut(Sn*d,u,d,r,K,m-1));
    value=max(z ,max( K-Sn,0));
end
% u = exp((.1191 - (.2389)^2/2)*(1/12)+.2389*(sqrt(1/12))) = 1.0795
% d = exp((.1191 - (.2389)^2/2)*(1/12)-.2389*(sqrt(1/12))) = 0.9404
