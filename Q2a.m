% Stock price information for Coca-Cola Company
S0 = 53.09;
T = [2, 6, 9, 14, 18]/52;
K = (45:.5:70)';

% Market prices of call options with strikes K and time to maturity T
cmarket = [8.1335    8.1990    8.2665    8.3505    8.4525
    7.6395    7.6730    7.7935    7.8885    7.9990
    7.1395    7.1810    7.3225    7.4375    7.5600
    6.6405    6.6665    6.8480    6.9970    7.1270
    6.1335    6.1695    6.4060    6.5680    6.7160
    5.6450    5.7045    5.9600    6.1365    6.3030
    5.1350    5.2185    5.5150    5.7190    5.8920
    4.6325    4.7335    5.0835    5.3230    5.5275
    4.1395    4.2710    4.6580    4.9295    5.1515
    3.6320    3.8110    4.2530    4.5585    4.7765
    3.1335    3.3610    3.8980    4.1880    4.4585
    2.6460    2.9325    3.5400    3.8475    4.1040
    2.1420    2.5060    3.1885    3.5330    3.8210
    1.6650    2.1435    2.8575    3.2230    3.5165
    1.1825    1.7965    2.5600    2.9315    3.2295
    0.7510    1.4760    2.2705    2.6645    2.9775
    0.4100    1.1960    2.0155    2.4120    2.7235
    0.1760    0.9475    1.7685    2.1695    2.4810
    0.0620    0.7370    1.5450    1.9425    2.2625
    0.0215    0.5620    1.3375    1.7475    2.0585
    0.0145    0.4250    1.1610    1.5595    1.8685
    0.0060    0.3105    0.9975    1.3945    1.6855
    0.0045    0.2315    0.8525    1.2190    1.5220
    0.0035    0.1710    0.7245    1.0970    1.3685
    0.0030    0.1255    0.6180    0.9640    1.2315
    0.0025    0.0925    0.5185    0.8500    1.1125
    0.0020    0.0755    0.4355    0.7445    0.9920
    0.0020    0.0585    0.3770    0.6495    0.8875
    0.0020    0.0470    0.3140    0.5680    0.7920
    0.0015    0.0445    0.2725    0.4965    0.7035
    0.0015    0.0395    0.2370    0.4385    0.6290
    0.0010    0.0300    0.1995    0.3775    0.5570
    0.0020    0.0265    0.1720    0.3375    0.5030
    0.0030    0.0245    0.1485    0.2970    0.4485
    0.0020    0.0190    0.1290    0.2570    0.4060
    0.0020    0.0160    0.1160    0.2235    0.3605
    0.0010    0.0150    0.1005    0.2000    0.3180
    0.0010    0.0130    0.0840    0.1780    0.2835
    0.0010    0.0120    0.0695    0.1585    0.2550
    0.0010    0.0110    0.0555    0.1405    0.2270
    0.0010    0.0105    0.0545    0.1225    0.2090
    0.0010    0.0095    0.0525    0.1125    0.1870
    0.0010    0.0090    0.0465    0.1010    0.1635
    0.0010    0.0095    0.0415    0.0900    0.1480
    0.0010    0.0090    0.0415    0.0775    0.1395
    0.0010    0.0075    0.0330    0.0695    0.1310
    0.0010    0.0085    0.0350    0.0660    0.1060
    0.0010    0.0085    0.0340    0.0595    0.1035
    0.0010    0.0085    0.0355    0.0515    0.0905
    0.0010    0.0085    0.0305    0.0480    0.0845
    0.0010    0.0080    0.0300    0.0465    0.0820];
sigma=zeros(length(K),length(T));
for i =1: length(T)
    for j=i:length(K)
        sigma(j,i)=blsimpv(S0,K(j),0,T(i),cmarket(j,i));
    end
end
sigma;
sigma_BS6=mean(sigma(:,2))
delta1=zeros(length(K),1);
for j=1:length(K)
    delta1(j)=blsprice(S0,K(j),0,6/52,sigma_BS6)-cmarket(j,2);
end
delta1