%% Quadruped Robot Modeling with Simscape(TM)
%
% This repository contains a Simscape model of a quadruped robot able to
% walk on flat and inclined terrain, with a environment that presents
% different obstacles, and the posibility of open-loop or interactive
% control system.
%
% *Main files*
%  
% # Complete Robot Model (Run): <matlab:open_system('complete_robot') Model>
% # Point cloud generation file: <matlab:edit('Parameters_pntcld.m') Script>
% 
% *Get up to speed*
%
% - Tutorial 1: <matlab:open_system('t01_one_leg') Create gait>
%
% The focus of this tutorial is set on implementing the gait function for 
% one leg, that it moves realistically and is able to perform a step forward.
% 
% - Tutorial 2: <matlab:open_system('t02_one_leg_sideways_movement') Create sideways gait>
%
% The focus of this tutorial is set on implementing an additional sideways 
% joint in a leg, that it is able to perform a lateral step which is later 
% needed for turning and walking sideways.
%
% - Tutorial 3: <matlab:open_system('t03_cobine_legs_to_torso') Combine legs and torso>
%
% This tutorial consists of building the first state of a walking four 
% legged robot, based on the leg elements and the gait functions from 
% tutorial 1 and 2.
%
% - Tutorial 4: <matlab:open_system('t04_combine_gaits') Combine different gaits>
%
% In this tutorial several gaits need to be combined that the robot is able 
% to perform different movements, depending on the control value which acts 
% as an input.
%
% - Tutorial 5: <matlab:open_system('t05_balancing') Balancing>
%
% In this tutorial a balancing function has to be implemented to make the
% center of gravity of the robot remain in the center of the support feet
% so the robot is stable even in inclined terrain.
%
% - Tutorial 6: <matlab:open_system('t06_manual_control') Manual control>
%
% This tutorial addresses how to connect an external controller (e.g. from 
% an Xbox) and use it to manually guide the robot.
%
% - Tutorial 7: <matlab:open_system('t07_open_loop_control') Open-loop control>
%
% This tutorial addresses some parts of the control process, from the 
% generation of the ideal path based in the occupancy grid, to the 
% sequential reading of the commands array.

% Copyright 2023-2024 The MathWorks(TM), Inc.
