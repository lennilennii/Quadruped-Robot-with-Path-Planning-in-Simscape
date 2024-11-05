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
t_leg =0.005;
L = 0.047;
legLength = t_leg;  
legWidth = t_leg;   
legHeight = L;   
Leg.PointCloud.MarkerRadius  = 5e-4*1.5;

% Create X, Y, Z Grid Coordinates 
[x, y, z] = ndgrid(linspace(-legLength/2, legLength/2, 10), ...
                   linspace(-legWidth/2, legWidth/2, 5), ...
                   linspace(0, legHeight, 15));

% 将网格展开成点云矩阵
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

for i = 40:1:45
    z_heights(i+1,:) = z_heights(i,:) - 0.1;
end

for i = 45:1:51
    z_heights(i,:) = 0;
end

% Wall Data
Wall_Height = 0.5;
Wall_Length = 0.01;
Wall_Width = 0.4;

% Wall #1
Wall1.index = [20, 10];
Wall1.position = [x_grid_vector(Wall1.index(1)), y_grid_vector(Wall1.index(2)), z_heights(Wall1.index(1), Wall1.index(2))];
Wall1.size = [Wall_Width, Wall_Length, Wall_Height];

% Wall #2
Wall2.index = [27, 10];
Wall2.position = [x_grid_vector(Wall2.index(1)), y_grid_vector(Wall2.index(2)), z_heights(Wall2.index(1), Wall2.index(2))];
Wall2.size = [Wall_Width, Wall_Length, Wall_Height];


occupancy = zeros(length(x_grid_vector), length(y_grid_vector));

occupancy((Wall1.index(1) - 1):(Wall1.index(1) + 1), Wall1.index(2)) = 1; % wall 1 transform to occupancy grid 
occupancy((Wall2.index(1) - 1):(Wall2.index(1) + 1), Wall2.index(2)) = 1; % wall 2 transform to occupancy grid
