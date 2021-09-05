clear
x = 0:0.8:3400;
y1 = 25000*(-2*(x./1600).^4+4*(x./1600).^3+0.5*(x./1600).^2);
n = 1;
for i=0:0.01:42.5
    y2(n)=10e5;
    m = n/1000;
    if i>30
        y2(n) = 100000*(-10*m^2+60*m-80);
    end
    n = n+1;
end
% plot(y1,'Color','r');
% hold on;
% plot(1:1:4001,y2,'Color','b');
% set(gca,'Ylim',[0,12e5],'Xlim',[0,5000])


[AX,H1,H2] = plotyy(x,y1,x,y2,'plot');
set(AX(1),'XColor','k','YColor','b','Ylim',[0,250000],'YTick',0:50000:250000);
set(AX(2),'XColor','k','YColor','r','Ylim',[0,11e5],'YTick',0:1e5:11e5);

HH1=get(AX(1),'Ylabel');
set(HH1,'String','weight / kg');


HH2=get(AX(2),'Ylabel');
set(HH2,'String','environment / kg');
xlabel('time / day');
legend([H1,H2],{'dragon';'environment'});