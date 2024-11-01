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
