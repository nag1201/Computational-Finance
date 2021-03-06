%% 1d
Npaths=100;
rho0=.015;
T  = 30;
Nsteps = 120; 
v0 = [1,.01];
[x,b]=fminsearch(@Q1c,v0)
gamma=sqrt(b/Nsteps);
Q1b(x(1),x(2),gamma,rho0,T,Npaths,Nsteps)

%%
% * *(i)* We get the values of alpha = .5878 and beta = 0.0148 and the
% corresponding value of Q1c is 4.2618e-05.
% * *(ii)* Using the values which we get in the first part the price comes
% out to be  0.6390 with confidence 95% confidence interval as [0.6383,0.6397] 
dataQ2A4
%% 2a 
sigma=zeros(length(K),length(T));
for i =1: length(T)
    for j=1:length(K)
        sigma(j,i)=blsimpv(S0,K(j),0,T(i),cmarket(j,i));
    end
end
sigma
sigma_BS6=mean(sigma(:,2))
delta1=zeros(length(K),1);
for j=1:length(K)
    delta1(j)=cmarket(j,2)- blsprice(S0,K(j),0,6/52,sigma_BS6);
end
delta1
%% 2c
paths1 = Q2b1(S0,0,6/52,5000,1000);
delta2=zeros(length(K),1);
for j=1:length(K)
    delta2(j) = cmarket(j,2)- priceCall1(paths1,K(j),0,6/52);
end
paths2 = Q2b2(S0,0,6/52,5000,1000);
delta3 = zeros(length(K),1);
for j=1:length(K)
    delta3(j) = cmarket(j,2)- priceCall1(paths2,K(j),0,6/52);
end
delta2
delta3
%% 2d
plot(45:.5:70,delta1,'r','LineWidth',2,'MarkerSize',12);
title('Comparison of delta1 vs delta2 vs delta3 for 6 weeks');
hold on
plot(45:.5:70,delta2,'b','LineWidth',2,'MarkerSize',12);
plot(45:.5:70,delta3,'g','LineWidth',2,'MarkerSize',12);
xlabel('strike price','fontsize',14);
ylabel('delta','fontsize',14)
plot([45,70],[0,0], 'k--')
legend('delta1','delta2','delta3','y=0');

hold off
figure()
%%
% * *(i)* This plot tells us the difference between the market call option
% values and the theoritical call option values for three different models.
% We have three different models
% here, by this plot we can see that which of the models accurately
% predicts the Call option price.
% * *(ii)* Model (1) gives more accurate call option prices as it is
% closest to the 0 line meaning we accurately predict the market call
% option price most of the times.
%% 2e
% for 2 weeks
sigma_BS2=mean(sigma(:,1));
delta12=zeros(length(K),2);
for j=1:length(K)
    delta12(j,1)=cmarket(j,1)-blsprice(S0,K(j),0,2/52,sigma_BS2);
end

delta22=zeros(length(K),2);
paths2w1 = Q2b1(S0,0,2/52,5000,1000);
paths2w2 = Q2b2(S0,0,2/52,5000,1000);
for j=1:length(K)
    delta22(j,1) = cmarket(j,1)- priceCall1(paths2w1,K(j),0,2/52);
    delta22(j,2) = cmarket(j,1)- priceCall1(paths2w2,K(j),0,2/52);
end
plot(45:.5:70,delta12(:,1),'r','LineWidth',2,'MarkerSize',12);
title('Comparison of delta1 vs delta2 vs delta3 for 2 weeks');

hold on
plot(45:.5:70,delta22(:,1),'b','LineWidth',2,'MarkerSize',12);
plot(45:.5:70,delta22(:,2),'g','LineWidth',2,'MarkerSize',12);
xlabel('strike price','fontsize',14);
ylabel('delta for 2 weeks','fontsize',14)
plot([45,70],[0,0], 'k--')
legend('delta1','delta2','delta3','y=0');

hold off
figure()
% 18 weeks
sigma_BS18=mean(sigma(:,5));
delta12=zeros(length(K),2);
for j=1:length(K)
    delta12(j,1)=cmarket(j,5)-blsprice(S0,K(j),0,18/52,sigma_BS18);
end

delta2_18=zeros(length(K),2);
paths18w1 = Q2b1(S0,0,18/52,5000,1000);
paths18w2 = Q2b2(S0,0,18/52,5000,1000);
for j=1:length(K)
    delta2_18(j,1) = cmarket(j,5)- priceCall1(paths18w1,K(j),0,18/52);
    delta2_18(j,2) = cmarket(j,5)- priceCall1(paths18w2,K(j),0,18/52);
end

plot(45:.5:70,delta12(:,1),'r','LineWidth',2,'MarkerSize',12);
title('Comparison of delta1 vs delta2 vs delta3 for 18 weeks');

hold on
plot(45:.5:70,delta2_18(:,1),'b','LineWidth',2,'MarkerSize',12);
plot(45:.5:70,delta2_18(:,2),'g','LineWidth',2,'MarkerSize',12);

xlabel('strike price','fontsize',14);
ylabel('delta for 18 weeks','fontsize',14)
plot([45,70],[0,0], 'k--')
legend('delta1','delta2','delta3','y=0');
hold off

%% 2f
% No, we do not get the same conclusion since for 2 weeks model(3) more 
% accurately predicts the call option price and for 18 weeks as well we 
% have model(3) giving a better estimate for the price since delta is closer to 0.
% (although for 18 weeks model(1) is not very far). The model(2) and
% model(3) are more accurate since they have local volatility whereas for
% model(1) the volatility is constant which is impled volatility in our case.
% 