clc,clear
rho = 15;
%X = zeros(1,365);
W = zeros(1,10);
W(1) = 10;            %初始体重
T = 300;
B0 = 14.0149;
B1 = 0.5371;
B2 = 0.0294;
B3 = 4799.0;
v_fly = 11;             %飞行速度
v_creep = 1;          %爬行速度
r = 2;
w_m = 1500;

for i = 2:1:60
    P_rest = 10 ^ (B0 + B1 * log10(W(i-1) * 1000) + B2 * (log10(W(i-1) * 1000)) ^ 2 - B3 / T);
    P_creep = 10.7 * W(i-1) ^ 0.684 * v_creep + 6.03 * (W(i-1)) ^ 0.6920;
    P_fly = 0.529 * (W(i - 1) * 9.8) ^ (-0.234) * W(i - 1) * v_fly;
    %P_fly = 102.0 * (W(i-1) * 1000) ^ 0.649;
    %P_fly = 0.927 * (W(i-1) * 9.8) ^ 0.80 * v_fly;
    E_fire = 6.94 * W(i-1) ^ (2 / 3);
    R = P_rest * 21 * 3.6 + P_creep * 2 / 1000 + P_fly * 1 / 1000 + 10 * E_fire;
    P = r * W(i-1)  - r * W(i-1)^2/w_m;
    P = P/2;
    W(i) = W(i - 1) + P;        % x=rho * W
    
end
plot(0:59,W(1:60))
set(gca,'Ylim',[0,1800])




% rho = 15;
% T = 300;
% B0 = 14.0149;
% B1 = 0.5371;
% B2 = 0.0294;
% B3 = 4799.0;
% v_fly = 15;             %飞行速度
% v_creep = 1;          %爬行速度
% r = 2;
% W(1) = 15000; w_m = 15000;
% i = 2;
% for n = 0.1:0.1:10
%     dw = 0.0044*W(i-1)*(1-W(i-1)/w_m);
%     
%     P_rest = 10 ^ (B0 + B1 * log10(W(i-1) * 1000) + B2 * (log10(W(i-1) * 1000)) ^ 2 - B3 / T);    %  j/s
%     P_creep = 10.7 * W(i-1) ^ 0.684 * v_creep + 6.03 * (W(i-1)) ^ 0.6920;            %kj/h
%     P_fly = 0.529 * (W(i - 1) * 9.8) ^ (-0.234) * W(i - 1) * v_fly;               %kj/h
%     E_fire = 6.94 * W(i-1) ^ (2 / 3);
%     R = P_rest * 2.2 * 3600/1000 + P_fly * 0.2 / 1000 + 10 * E_fire;        %P_creep * 2 / 1000 + 
%     W(i) = W(i-1) - R/rho/6 + dw*22/24;
%     i = i+1;
% end
% plot(0:0.1:10,W);
% set(gca,'Ylim',[0,16000],'XTick',0:2:10,'Xlim',[0,10]);  %,'XTick',0:2:12,'Xlim',[0,15]
% title('Fly 1h');
% xlabel('Time(Day)');
% ylabel('Dragon Weight(Kg)');





