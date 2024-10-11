close all;

struct_control = out.control_variable;
struct_x = out.x;
%struct_temp = out.temp;

struct_t_FL = out.t_FL;
struct_t_FR = out.t_FR;
struct_t_BL = out.t_BL;
struct_t_BR = out.t_BR;

save1 = true; % true: Plot saved, false: Plot not saved
save2 = false;

plot_c_over_t(save2, struct_control);
%plot_x_over_t(save2, struct_x, struct_control);
%plot_temp_over_t(save2,struct_temp);
plot_several_signals(save2, struct_t_FL.time, struct_t_FL, struct_t_FR, struct_t_BL, struct_t_BR);
