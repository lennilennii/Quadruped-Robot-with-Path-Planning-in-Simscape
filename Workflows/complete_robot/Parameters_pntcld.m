% Grid Surface Ball Parameters Initialization

% Copyright 2023 The MathWorks, Inc.

%% Ball %%

Ball.Radius                   = 0.01;                     % m
Ball.Density                  = 1000;                    % kg/m^3
Ball.PointCloud.MarkerRadius  = 5e-4*1.5;                % m
pointDensity = 15;
[X,Y,Z] = sphere(round(pointDensity));
Ball.sphere_ptcld = unique([reshape(X*Ball.Radius,[],1) reshape(Y*Ball.Radius,[],1) reshape(Z*Ball.Radius,[],1)],'rows');

%% Leg %%
t_leg =0.005;                                    % m
L = 0.047;                                       % m
legLength = t_leg;  
legWidth = t_leg;   
legHeight = L;   
Leg.PointCloud.MarkerRadius  = 5e-4*1.5;          % m

% Create X, Y, Z Grid Coordinates 
[x, y, z] = ndgrid(linspace(-legLength/2, legLength/2, 10), ...
                   linspace(-legWidth/2, legWidth/2, 5), ...
                   linspace(0, legHeight, 15));


leg_PointCloud = unique([x(:), y(:), z(:)], 'rows');

%% Occupancy Grid %%

x_grid_vector = 0:0.2:10;
y_grid_vector = 0:0.2:5;

z_heights = zeros(length(x_grid_vector), length(y_grid_vector));

for i = 1:1:5
    z_heights(i,:) = 0;
end

for i = 5:1:9
    z_heights(i+1,:) = z_heights(i,:) + 0.1;
end

for i = 10:1:39
    z_heights(i+1,:) = z_heights(i,:);
end

for i = 40:1:44
    z_heights(i+1,:) = z_heights(i,:) - 0.1;
end

for i = 46:1:51
    z_heights(i,:) = 0;
end





% Wall Data
Wall_Height = 0.5;
Wall_Length = 0.01;
Wall_Width = 1.6;

% Compute the angle between Wall 1 & 3
delta_x = (Wall3.position(1)-Wall3.size(1)/2) - (Wall1.position(1) + Wall1.size(1)/2) ;
delta_y = y_grid_vector(Wall3.index(2)) - y_grid_vector(Wall1.index(2));
theta = atan2(delta_y, delta_x);  
theta_val1 = theta;

% Wall #1
Wall1.index = [14, 10];
Wall1.position = [x_grid_vector(Wall1.index(1)), y_grid_vector(Wall1.index(2)), z_heights(Wall1.index(1), Wall1.index(2))];
Wall1.size = [Wall_Width, Wall_Length, Wall_Height]; 


% Wall #2
Wall2.index = [22, 12];
Wall2.position = [x_grid_vector(Wall2.index(1)), y_grid_vector(Wall2.index(2)), z_heights(Wall2.index(1), Wall2.index(2))];
Wall2.size = [sqrt((delta_x)^2 + (delta_y)^2), Wall_Length, Wall_Height];



% Wall #3
Wall3.index = [30, 14];
Wall3.position = [x_grid_vector(Wall3.index(1)), y_grid_vector(Wall3.index(2)), z_heights(Wall3.index(1), Wall3.index(2))];
Wall3.size = [Wall_Width, Wall_Length, Wall_Height];



% Compute the angle between Wall 4 & 6
delta_x_2 = (Wall6.position(1)-Wall6.size(1)/2) - (Wall4.position(1) + Wall4.size(1)/2) ;
delta_y_2 = y_grid_vector(Wall6.index(2)) - y_grid_vector(Wall4.index(2));
theta_2 = atan2(delta_y_2, delta_x_2);  
theta_val2 = theta_2;

% Wall #4
Wall4.index = [14, 8];
Wall4.position = [x_grid_vector(Wall4.index(1)), y_grid_vector(Wall4.index(2)), z_heights(Wall4.index(1), Wall4.index(2))];
Wall4.size = [Wall_Width, Wall_Length, Wall_Height];


% Wall #5
Wall5.index = [22, 10];
Wall5.position = [x_grid_vector(Wall5.index(1)), y_grid_vector(Wall5.index(2)), z_heights(Wall5.index(1), Wall5.index(2))];
Wall5.size = [sqrt((delta_x_2)^2 + (delta_y_2)^2), Wall_Length, Wall_Height];

% Wall #6
Wall6.index = [30, 12];
Wall6.position = [x_grid_vector(Wall6.index(1)), y_grid_vector(Wall6.index(2)), z_heights(Wall6.index(1), Wall6.index(2))];
Wall6.size = [Wall_Width, Wall_Length, Wall_Height];


occupancy = zeros(length(x_grid_vector), length(y_grid_vector));

occupancy((Wall1.index(1) - 1):(Wall1.index(1) + 1), Wall1.index(2)) = 1; % wall 1 transform to occupancy grid 
occupancy((Wall3.index(1) - 1):(Wall3.index(1) + 1), Wall3.index(2)) = 1; % wall 3 transform to occupancy grid
occupancy((Wall4.index(1) - 1):(Wall4.index(1) + 1), Wall4.index(2)) = 1; % wall 4 transform to occupancy grid 
occupancy((Wall6.index(1) - 1):(Wall6.index(1) + 1), Wall6.index(2)) = 1; % wall 6 transform to occupancy grid