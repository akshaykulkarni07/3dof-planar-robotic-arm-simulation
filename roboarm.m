% Initial points of the 3 arms
x = [0 0 1 1];
y = [0 1 1 0];

% Draw lines in initial positions
for i = 1 : 3
    line([x(i), x(i + 1)], [y(i), y(i + 1)]);
    axis([-4 4 -4 4]);
end

% I am assuming the reference frames' x axes along the length of
% the links for each link.
% theta = angle from old x to new x along old z axis
% but z axis is same due to planar nature of arm.

theta1 = pi / 6;
theta2 = pi / 4;
theta3 = pi / 3;

% transformation matrices
T1 = [cos(theta1) -sin(theta1) 0 0;
    sin(theta1) cos(theta1) 0 0;
    0 0 1 0;
    0 0 0 1];
T2 = [cos(theta2) -sin(theta2) 0 1;
    sin(theta2) cos(theta2) 0 0;
    0 0 1 0;
    0 0 0 1];
T3 = [cos(theta3) -sin(theta3) 0 1;
    sin(theta3) cos(theta3) 0 0;
    0 0 1 0;
    0 0 0 1];
T4 = [1 0 0 1;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];
% R = [x(2) y(2) 0] * T;
R1 = T1 * [x(1); y(1); 0; 1]; 
x(1) = R1(1);
y(1) = R1(2);
% axis([-4 4 -4 4]);
R2 = T1 * T2 * [x(2); y(2); 0; 1];
x(2) = R2(1);
y(2) = R2(2);


R3 = T1 * T2 * T3 * [x(3); y(3); 0; 1];
x(3) = R3(1);
y(3) = R3(2);
R4 = T1 * T2 * T3 * T4 * [x(4); y(4); 0; 1];
x(4) = R4(1);
y(4) = R4(2);
length = (x(2) - x(3)) .^ 2 + (y(2) - y(3)) .^ 2;
line([x(1), x(2)], [y(1), y(2)]);
line([x(2), x(3)], [y(2), y(3)]);
line([x(3), x(4)], [y(3), y(4)]);
disp(length);