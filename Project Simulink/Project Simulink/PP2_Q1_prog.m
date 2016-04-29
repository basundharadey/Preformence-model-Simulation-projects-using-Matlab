sim('PP2_Q1'); 
plot(x_output.time, x_output.signals.values, 'r-.x');
xlabel('t'); 
ylabel('X(t)');
legend('X(t)');