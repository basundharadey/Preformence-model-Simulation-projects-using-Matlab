N=400000;
IZero=2;
Eta=2.5;
Gamma=0.025;
Mu=0.08/N;
BetaZero=1/N;
sim('PP2_Q2.mdl');
hold on;
plot(JT.time, JT.signals.values,'y:s');
plot(IT.time, IT.signals.values,'m--o');
plot(QT.time, QT.signals.values,'c-.^');
legend('J(t)','I(t)','Q(t)');
xlabel('Time'); ylabel('No of Hosts');
title('The Two-Factor Worm Propagation');

