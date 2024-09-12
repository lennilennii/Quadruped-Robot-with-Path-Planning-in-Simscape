function plot_x_over_t(save, struct)
    time = struct.time;
    data = struct.signals.values;
    figure;
    plot(time, data);
    xlabel('Time');
    ylabel('X-value');
    title('X-value over time');

    if save
        timestamp = datetime('now', 'Format', 'dd_MM-HH_mm');
        filename = ['Workflows\complete_robot\plots_for_debug\x_over_t\x_over_t_plot-' char(timestamp) '.fig'];
        saveas(gcf, filename);
    end
end

