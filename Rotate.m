function [ R ] = Rotate( theta )
%Rotate Returns rotation matrix
%   Input angle theta is used to create 3x3 rotation matrix
R = [cos(theta) -sin(theta) 0 0;
    sin(theta) cos(theta) 0 0;
    0 0 1 0
    0 0 0 1];
end