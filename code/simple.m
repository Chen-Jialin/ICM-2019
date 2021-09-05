
clear
w_m = 15000;
w_m2 = 12000;
w_m3 = 18000;
w(1) = 10;
w2(1) = 10;
w3(1) = 10;
i = 2;
for j = 0:0.1:400
    if i<=350000
        dw = 0.0044*w(i-1)*(1-w(i-1)/w_m);
        dw2 = 0.0044*w2(i-1)*(1-w2(i-1)/w_m2);
        dw3 = 0.0044*w3(i-1)*(1-w3(i-1)/w_m3);
    end
%     if i>3500
%         dw = 0.0044*w(i-1)*(1-w(i-1)/w_m2);
%     end
    
    w(i) = w(i-1)+dw;
    w2(i) = w2(i-1)+ dw2;
    w3(i) = w3(i-1) + dw3;
    i = i+1;
end
plot(w3,'LineWidth',1.5);
hold on;
plot(w,'LineWidth',1.5);

%plot([0,3000],[15000,15000],'--','Color','r');
plot(w2,'LineWidth',1.5);

ylim([0,20000]);
legend('temperate region','scorching region','arctic region');
xlabel('Time Period(Day)');
ylabel('The weight of the Dragon(Kg) ');
%set(gca,'Ylim',[0,20000]);
%legend([w,w2,w3],{'1','2','3'});
grid on






% for i = 1:1:4002
%     y1(i) = 10e5;
%     y2(i) = 10e5;
%     if i<=350000
%         y1(i) = 10e5 - w(i);
%     end
% %     if i>3500
% %         y1(i) = 0;
% %     end
% end
% x = 1:1:4002;
% [AX,H1,H2] = plotyy(x,w,x,y1,'plot');
% set(AX(1),'XColor','k','YColor','b','Ylim',[0,25000],'YTick',0:5000:25000);
% set(AX(2),'XColor','k','YColor','r','Ylim',[0,11e5],'YTick',0:1e5:11e5);
% 
% HH1=get(AX(1),'Ylabel');
% set(HH1,'String','weight / kg');
% 
% 
% HH2=get(AX(2),'Ylabel');
% set(HH2,'String','environment / kg');
% xlabel('time / day');
% legend([H1,H2],{'dragon';'environment'});
% plot(y1);
% hold on
% plot(y2,':')
% set(gca,'Ylim',[0,20e5])






% for x = 0:1:3650
%     if x<=3000
%         y(i) = w_m./(1+(w_m/10-1)*exp(-0.0044.*x));
%     end
%     
%     if x>3000
%         y(i) = w_m2./(1+(w_m2/10-1)*exp(-0.0044.*x))+ w_m./(1+(w_m/10-1)*exp(-0.0044.*3000)) - w_m2./(1+(w_m2/10-1)*exp(-0.0044.*3000));
%         j = 5;
%     end
%     i = i +1;
% end
% plot(y)


% rho = 15;
% T = 300;
% B0 = 14.0149;
% B1 = 0.5371;
% B2 = 0.0294;
% B3 = 4799.0;
% v_fly = 15;             %飞行速度
% v_creep = 1;          %爬行速度
% r = 2;
% W(1) = 15000;
% i = 2;
% for n = 0.1:0.1:0.5 
%     dw = 0.0044*W(i-1)*(1-W(i-1)/w_m);
%     
%     P_rest = 10 ^ (B0 + B1 * log10(W(i-1) * 1000) + B2 * (log10(W(i-1) * 1000)) ^ 2 - B3 / T);    %  j/s
%     P_creep = 10.7 * W(i-1) ^ 0.684 * v_creep + 6.03 * (W(i-1)) ^ 0.6920;            %kj/h
%     P_fly = 0.529 * (W(i - 1) * 9.8) ^ (-0.234) * W(i - 1) * v_fly;               %kj/h
%     E_fire = 6.94 * W(i-1) ^ (2 / 3);
%     R = P_rest * 1.8 * 3600/1000 + P_fly * 0.6 / 1000 + 10 * E_fire; %P_creep * 2 / 1000 + 
%     W(i) = W(i-1) - R/rho + dw*3/4;
%     i = i+1;
% end
% plot(1:i-1,W)









