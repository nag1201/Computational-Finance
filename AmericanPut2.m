function value = AmericanPut2(Sn,u,d,r,K,m)
f=zeros(m+1,1);
pmat = zeros(m+1);
qu=(1+r-d)/(u-d);
qd=1-qu;
for i=1:m+1
    f(i)= max(K-Sn*(u^(m+1-i))*d^(i-1),0);
end
pmat(:,end) = f;
for j = 0:(m-1)
    for k = 1:(m-j)
        pmat(k,m-j) = max(   max(   K -   Sn*(u^(m-j-k))*d^(k-1)  ,   0 )  ,  (qu*pmat(k,m-j+1)+ qd*pmat(k+1,m-j+1))/(1+r) );
        %if (K-S*u^k*d^(m-k))>(qu*pmat(k,m-j+1)+ qd*pmat(k+1,m-j+1))/(1+r)
         %   value=pmat(k,m-j)
    end
end
value = pmat(1,1);
% exp((.1191 - (.2389)^2/2)*(7/(12*1500))+.2389*(sqrt(7/(12*1500)))) =1.0048

% exp((.1191 - (.2389)^2/2)*(7/(12*1500))-.2389*(sqrt(7/(12*1500)))) =.9953
