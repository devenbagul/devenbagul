msp = 300/4;
musp = 10;
ks = 20.6;
kt = 140;
c1 = 72;

% Natural frequencies
w_g1 = sqrt(ks/msp); 
w_g2 = sqrt(kt/musp);
 
criticaldamp=2*(sqrt(ks*musp));

dr = c1 / (2 * sqrt(msp * ks));

frequency_ratios = linspace(0, 5, 5000);

h = zeros(size(frequency_ratios));
for i = 1:length(frequency_ratios)
    omega = frequency_ratios(i) * w_g1;
    h(i) = sqrt(((kt/ks)^2 + (c1*omega/ks)^2 + (1 - (omega/w_g1)^2 + (kt/ks)*(1 - (omega/w_g2)^2))^2) /((1 - (omega/w_g1)^2)^2 + (2*dr*omega/w_g1)^2));
end

figure;
plot(frequency_ratios, h);
xlabel('frequency ratio');
ylabel('transmisibility');
grid on;
