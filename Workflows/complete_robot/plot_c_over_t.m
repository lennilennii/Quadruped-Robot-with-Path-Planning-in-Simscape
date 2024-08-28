time = out.control_variable.time;
data = out.control_variable.signals.values;

plot(time, data);
xlabel('Time');
ylabel('Control value');
title('Control value over time');

%saveas(gcf, 'control_over_t_plot.fig');