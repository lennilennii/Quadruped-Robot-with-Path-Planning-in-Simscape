struct_control = out.control_variable;
struct_x = out.x;

save = true; % true: Plot saved, false: Plot not saved

plot_c_over_t(save, struct_control);
plot_x_over_t(save, struct_x);