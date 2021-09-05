W = 10:1:100;
P_rest = 10 .^ (B0 + B1 * log10(W * 1000) + B2 * (log10(W * 1000)) .^ 2 - B3 / T);
P_creep = 10.7 * W .^ 0.684 * v_creep + 6.03 * W .^ 0.6920;
P_fly = 0.529 * (W * 9.8) .^ (-0.234) .* W * v_fly;
E_fire = 6.94 * W .^ (2 / 3);
E = P_rest * 21 * 3.6 + P_creep * 2 / 1000 + P_fly * 1 / 1000 + 10 * E_fire;
plot(W,E)
hold on
plot(W,119 * W .^ 0.739976777562775)
legend('lost','get')