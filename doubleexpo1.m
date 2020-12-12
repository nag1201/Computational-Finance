function sum= doubleexpo1(p,q,eta,phi,Nsamples)
r=rand(1,Nsamples);
Y=zeros(1,Nsamples);
sum=0;
for i=1:Nsamples
    if r(i)<q
        Y(i)=(1/phi)*log(r(i)/q);
    elseif r(i)==q
        Y(i)=0;
    else
        Y(i)=(1/eta)*log(p/(1-r(i)));
        
    end
    sum=sum+Y(i);
end
%plot(Y)