function [ T ] = Translate( d )
%Translate Returns translation matrix
%   Returns 3x3 translation matrix using displacement d.

T = [1 0 0 d;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
end