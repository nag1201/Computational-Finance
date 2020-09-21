%% Assignment 3, Nishant Agrawal
%% Questions 1 and 2
% _*Please see the separate m-files where required in the zipped folder*_
%% 1(b) 
rng('default')
T = 3.5/12;
S0 = 9624;
X0 = 29398;
K1 = 10000;
K2 = 30000;
k=10000;
sigma = blsimpv(9624,10000,0,3.5/12,197);
alpha =blsimpv(29398,30000,0,3.5/12,633);
PriceRainbow1(sigma, alpha,T,S0,X0,K1,K2,k)

% 
%%
% *The function gives us the call option price of 760.4054 with 95% confidence interval of [738.367, 782.443]*

%% 1(c) 
rng('default')
T = 3.5/12;
S0 = 9624;
X0 = 29398;
K1 = 10000;
K2 = 30000;
k=10000;
rho=.7;
sigma = blsimpv(9624,10000,0,3.5/12,197);
alpha =blsimpv(29398,30000,0,3.5/12,633);
PriceRainbow2(sigma, alpha,T,S0,X0,K1,K2,k,rho)
 % 
 %%
 % *The value of call option price is 670.3501 with 95% confidence interval as  [647.9369,  692.7633]*
%% 1(d)
% *The value in (1b) is higher than in 1c) since in 1c) there is a positive 
% correlation. If stock with price 'ST' drops there is a good chance that 
% value of 'XT' also drops and same for going up. Hence there is a good 
% chance that if 'ST' gains then 'XT' also gains and hence the option 
% is not exercised. On the contrary in 1b) they are independent. Also we 
% can further add that if they are negatively correlated than the price
% of the option will go up*

%% 1(f) 
rng('default')
T = 3.5/12;
S0 = 9624;
X0 = 29398;
K1 = 10000;
K2 = 30000;
k=10000;
rho=.7;
sigma = blsimpv(9624,10000,0,3.5/12,197);
alpha =blsimpv(29398,30000,0,3.5/12,633);
PriceRainbow3(sigma, alpha,T,S0,X0,K1,K2,k,rho)
% 
%%
% 
% *  *The value of call option price is 672.6032 with 95% confidence 
% interval
% as  [659.6409, 685.5654]. If we see the confidence interval has shrunk 
% by a factor of (692.7633-647.9369)/(685.5654-659.6409)= 1.7291. Since
% 1.729^2 = 2.984. The ratio of the length of the confidence interval is  
% also a ratio of the standrd deviation of the samples from PriceRainbow2 
% and PriceRainbow3 since the confidence interval is given by 
% (\mu  - z*sigma/sqrt(n),\mu  + z*sigma/sqrt(n)). Hence square of it 
% will be the ratio of variance of the sample in  PriceRainbow2 and 
% PriceRainbow3. That is 
% Var(price from sample in PriceRainbow2)/Var(price from sample in 
% PriceRainbow3) = 2.98*. 
% *  *By the lemma stated in the notes of chapter 3, for monotonous 
% function in antithetic sampling the covariance comes out 
% to be neagative, the variance in the antithetic sample is always less 
% than or equal to half of that in the standard sample. That is variance is 
% will get reduced by a factor of atleast 2 if the condition of lemma is 
% satisfied which also happens here.
% Since max(. , .)  is a monotonic function we can apply the 
% above mentioned lemma.*
% *  *From above we can see that ratio of the variances from two samples 
% does exceed 2 and hence the variance
% decreases for the antithetic sampling by a factor of more than 2 
% (2.98 to be more precise).  Since the variance decreases we see that the 
% confidence interval shrinks .*


%% 2(a)
% The value of the option for n=N will be max(K-Sn,0).

%% 2(c) 
% we calculate for 
N=7;
T=7/12;
m=7;
u=exp((.1191 - (.2389)^2/2)*(1/12)+.2389*(sqrt(1/12)));
d=exp((.1191 - (.2389)^2/2)*(1/12)-.2389*(sqrt(1/12)));
Sn=78.79;
K=75;
r=.01/12;
AmericanPut(Sn ,u , d, r, K, m)
% 
%%
% *This gives the value of 3.7557.*

%% 2(d) 

% 
%%
% *The price of American Put option will be higher compared to the European
% option. We pay more premium for American Put option since we can exercise the 
% option anytime midway , sell the stock and earn interest upto the 
% time till maturity. The
% selling in European Option can only be done at the time of maturity.
% The higher premium for American Put can also be attributed to the fact
% that it can be exercised early and at any time before the maturity which 
% is advatntageous since price can fall below the strike price level 
% (or even further) on any day before the maturity date* 

%% 2(e) 
N=1500;
T=7/12;
m=1500;
u=exp((.1191 - (.2389)^2/2)*(T/N)+.2389*(sqrt(T/N)));
d=exp((.1191 - (.2389)^2/2)*(T/N)-.2389*(sqrt(T/N)));
Sn=78.79;
K=75;
r=.01*T/N;
AmericanPut2(Sn ,u , d, r, K, m)
% 
%%
% *This gives the value of 3.7308.*

%% 2(f) 
% *It is desirable to have more than one points as we have started with 
% discretising the interval [0,Tm] where Tm is time to maturity. Since American Put 
% option can be executed at anytime before Tm hence smaller the size of the 
% T/N better will be the approximation to the true value of the american 
% Option.*

%% 2(g)
% * The AmericanPut2 is more efficient than AmericanPut since while 
% doing the recurssion there are many instances of the code waiting in the 
% ram of the computer for the output from the recursion to be executed 
% which does not 
% happen for AmericanPut2 as in AmericanPut2 the values are straight away 
% calculated and stored. In AmericanPut for m time step the function is  
% called 2^(m+1) - 1 since first state (0 state) is called once 
% 'the state t=1' is called twice, 'the state t=2' is called four times and 
% so on. If we sum up these which is
% 1 + 2 + 2^2 + 2^3+....+2^m we get 2^(m+1) -1 calls for one calculation in
% AmericanPut.
% On the otherhand in AmericanPut2 the number of entries 
% of the matrix is (m+1)*(m+2)/2 for (m+1*m+1) matrix. We can clearly see
% for large m; 2^(m+1) -1>> (m+1)(m+2)/2 and hence by this comparison 
% AmericanPut2 is far more efficient
% than AmericanPut for large m* 
