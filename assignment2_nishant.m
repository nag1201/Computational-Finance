%% 1e
% Here with strike price even the call and put price might change which are market determined. For call and put prices which are market determined we do not have any data and we have not assumed any underlying distribution as in the case of Black scholes and then we calculate the implied volatility. Hence we do not expect any phenomenon to occur. We also see that the rho should be independent of the strike price.  
%% 1f
%We wrote the function assign2q1d.m for the part d to evaluate the interest rate rho. Answer to 1(f) is as follows. 
S0 = 3317;
k = 3350;
d = .0185;
T=3/12;
c=61;
p=96;
intr=Q1d(d,T,c,p,S0,k);
intr
% we get the interest as 1.5 percent
cimpv=blsimpv(S0,k,intr,T,c)
% implied volatility on call option is 10.61 percent
pimpv=blsimpv(S0,k,intr,T,p)
% implied volatility on call option is 15.91 percent
%% 2d 
m = [0.2271; 0.4246; 0.2741; 0.0801];
sigma = [0.2175; 0.3201; 0.2232; 0.1714];
cor = [1, 0.613, 0.66, 0.106;
       0.613, 1, 0.499, 0.06;
       0.66, 0.499, 1, 0.097;
       0.106, 0.06, 0.097, 1];
cov=[];
for i=1:4
    for j=1:4
        cov(i,j)=sigma(i)*sigma(j)*cor(i,j);
    end
end
rT=0:0.02:0.6;
var=zeros(1,length(rT));
for i=1:length(rT)
    %p=[];
    p=Q2c(rT(i),m',cov);
    var(i)=Q2b(p,rT(i),m',cov);
end
scatter(sigma,m,'MarkerFaceColor','b') % plot single stocks
hold on
set(gca,'fontsize',14,'FontWeight','bold');
xlabel('Standard deviation of returns (annualized)','fontsize',14);
ylabel('Mean of returns(annualized)','fontsize',14);
title('Asset Risks and Returns');
labels = {'GOOGL','FB','MSFT','WMT'};
plot(sqrt(var),rT)
dx = 0.005;
text(sigma+dx,m,labels)
hold off 
%% 2e
% we realize that our weights corresponding to the 2d at rT = 0.4 is [-0.2903    0.6967    0.6319   -0.0382] 
%% (i) 
% For no short selling we see that our portfolio will lie to the Right of
% the frontier found in '2d'. We have to the right of the frontier in '2d'
% since no shortselling condition is more constrained compared to what we
% have in '2d'. Our sigma also will be little higher compared to the portfolio we
% get in '2d'
%% (ii)
% For 130-30 stratergy the portfolio will almost lie on the frontier and  to the slightly right of the frontier in '2d' since it is more constrained than the frontier and also since the sigma is little more compared to the '2d'. 
%% (iii) 
% For 150-50 stratergy the portfolio will lie on the frontier since the sum of negative weights is 'more' than -.5 or does not exceed the limit of -.5, and for positive weights is less than 1.5.