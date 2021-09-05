clc,clear
rho = 15;
W(1) = 10;%初始体重
T = 300;
B0 = 14.0149;
B1 = 0.5371;
B2 = 0.0294;
B3 = 4799.0;
v_fly = 11;             %飞行速度
v_creep = 1;          %爬行速度
%E_fire = 32.233; 一次喷火消耗的能量（kj）
beta = 0.739976777562775;

M(2:365) = inf;
M(1) = 10;
mindelta = inf;
% for k = 110:0.01:130
    
for i = 2:1:365
    P_rest = 10 ^ (B0 + B1 * log10(W(i-1) * 1000) + B2 * (log10(W(i-1) * 1000)) ^ 2 - B3 / T);
    P_creep = 10.7 * W(i-1) ^ 0.684 * v_creep + 6.03 * (W(i-1)) ^ 0.6920;
    P_fly = 0.529 * (W(i - 1) * 9.8) ^ (-0.234) * W(i - 1) * v_fly;
    %P_fly = 102.0 * (W(i-1) * 1000) ^ 0.649;
    %P_fly = 0.927 * (W(i-1) * 9.8) ^ 0.80 * v_fly;
    E_fire = 32.233 * W(i-1) ^ (2 / 3);
    E = P_rest * 22.67 * 3.6 + P_creep * 1/3 / 1000 + P_fly * 1 / 1000 + 10 * E_fire;
    W(i) = W(i - 1) + k * W(i-1) ^ beta - E / rho;
end
%     temp = W(365) - 45;
%     if temp < mindelta
%         M = W;
%         minddelta = temp;
%         finalk = k;
%     end
%     W(1) = 10;
%     W(2:365) = inf;
% end
plot(1:365,M(1:365));
