% Initial points of the 3 arms
x = [0 1 2 3];
y = [0 0 0 0];

% Draw lines in initial positions
for i = 1 : 3
    line([x(i), x(i + 1)], [y(i), y(i + 1)]);
    axis([-4 4 -4 4]);
end

% I am assuming the reference frames' x axes along the length of
% the links for each link.
% theta = angle from old x to new x along old z axis
% but z axis is same due to planar nature of arm.
t1 = input('Enter theta 1 in radians\n');
t2 = input('Enter theta 2 in radians\n');
t3 = input('Enter theta 3 in radians\n');
theta1 = t1;
theta2 = -pi + t2;
theta3 = t3 - pi;

% transformation matrices

% rotation matrices
R1 = Rotate(theta1);
R2 = Rotate(theta2);
R3 = Rotate(theta3);

% translation matrices
% as length is same for all links, so only one is needed now.
T2 = Translate(1);

% finding second point
Y = R1 * T2;
Y1 = Y * [0; 0; 0; 1];
x(2) = Y1(1);
y(2) = Y1(2);

% finding third point
Y = R1 * T2 * R2 * T2;
Y1 = Y * [0; 0; 0; 1];
x(3) = Y1(1);
y(3) = Y1(2);

% finding fourth point
Y = R1 * T2 * R2 * T2 * R3 * T2;
Y1 = Y * [0; 0; 0; 1];
x(4) = Y1(1);
y(4) = Y1(2);

% display points
length1 = (((x(1) - x(2)) .^ 2) + ((y(1) - y(2)) .^ 2)) .^ (0.5);
length2 = (((x(3) - x(2)) .^ 2) + ((y(3) - y(2)) .^ 2)) .^ (0.5);
length3 = (((x(3) - x(4)) .^ 2) + ((y(3) - y(4)) .^ 2)) .^ (0.5);
disp(length1);
disp(length2);
disp(length3);
line([x(1), x(2)], [y(1), y(2)]);
line([x(2), x(3)], [y(2), y(3)]);
line([x(3), x(4)], [y(3), y(4)]);