x = linspace(0,150);
y = 15000./(1 + (15000/10 - 1) *exp(-0.1 * x) );
plot(x,y)
hold on
plot([0,150],[15000,15000],'--')
xlim([0,150]);
ylim([0,16000]);
xlabel('time / day')
ylabel('weight / kg')