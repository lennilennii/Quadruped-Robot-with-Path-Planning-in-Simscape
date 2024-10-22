% Grid Surface Ball Parameters Initialization

% Copyright 2023 The MathWorks, Inc.

%% Ball %%

Ball.Radius                   = 0.01;                     % m
Ball.Density                  = 1000;                    % kg/m^3
Ball.PointCloud.MarkerRadius  = 5e-4*1.5;                % m
pointDensity = 15;
[X,Y,Z] = sphere(round(pointDensity));
Ball.sphere_ptcld = unique([reshape(X*Ball.Radius,[],1) reshape(Y*Ball.Radius,[],1) reshape(Z*Ball.Radius,[],1)],'rows');

