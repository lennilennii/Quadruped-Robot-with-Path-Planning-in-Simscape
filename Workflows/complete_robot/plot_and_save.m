struct_control = out.control_variable;
struct_x = out.x;
struct_temp = out.temp;

save1 = true; % true: Plot saved, false: Plot not saved
save2 = false;

plot_c_over_t(save2, struct_control);
plot_x_over_t(save2, struct_x);
plot_temp_over_t(save2,struct_temp);