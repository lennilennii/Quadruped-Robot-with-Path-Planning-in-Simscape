function plot_x_over_t(save, struct, structControl)
    time = struct.time;
    data = struct.signals.values;
    dataMin = min(data);
    dataMax = max(data);

    controlData = structControl.signals.values;
    controlChange = [];
    for i=2:length(controlData)
        if controlData(i) ~= controlData(i-1)
            controlChange(end + 1) = time(i);
        end
    end

    figure;
    plot(time, data);
    hold on;
    for i=1:length(controlChange)
        plot ([controlChange(i), controlChange(i)], [dataMin * 1.1, dataMax * 1.1], '--k');
    end
    dataMin = min(data);
    dataMax = max(data);
    xlabel('Time');
    ylabel('X-value');
    ylim([dataMin * 1.1, dataMax * 1.1]);
    title('X-value over time');

    if save
        timestamp = datetime('now', 'Format', 'dd_MM-HH_mm');
        filename = ['Workflows\complete_robot\plots_for_debug\x_over_t\x_over_t_plot-' char(timestamp) '.fig'];
        saveas(gcf, filename);
    end
end

