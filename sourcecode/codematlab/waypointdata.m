eeName = 'Pen';
numJoints = numel(ur10.homeConfiguration);

% Maximum number of waypoints (for Simulink)
maxWaypoints = 20;

% Positions (X Y Z) của các điểm viết chữ
waypoints = [-0.18 0.4 0.73; -0.18 0.5 0.73; -0.18 0.5 1.1; -0.35 0.79 1.1; -0.1 0.5 1.1; -0.1 0.5 0.73; -0.1 0.5 0.82; -0.35 0.79 0.82; -0.02 0.5 1; -0.02 0.5 0.73; -0.25 0.5 1.12; -0.25 0.79 1.1; 0.07 0.5 0.92; 0.07 0.5 0.73; -0.24 0.5 0.81; -0.24 0.79 0.81]';
         
%  Euler Angles (Z Y X) relative to the home orientation !!! ko quan trọng       
%  orientations = [0     0    0;
%                  pi/8  0    0; 
%                  0    pi/2  0;
%                 -pi/8  0    0;
%                  0     0    0
%                  0     0    0]';   
            
% Array of waypoint times
waypointTimes = 0:2:30;

% Trajectory sample time
ts = 0.01;
trajTimes = 0:ts:waypointTimes(end);

%% Additional parameters !!! ko quan trọng trong bài này

% Boundary conditions (for polynomial trajectories)
% Velocity (cubic and quintic)
waypointVels = 0.1 *[ 0  1  0;
                     -1  0  0;
                      0 -1  0;
                      1  0  0;
                      0  1  0]';

% Acceleration (quintic only)
waypointAccels = zeros(size(waypointVels));

% Acceleration times (trapezoidal only)
waypointAccelTimes = diff(waypointTimes)/4;
