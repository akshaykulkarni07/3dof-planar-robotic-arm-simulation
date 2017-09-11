% Initial positions of the joints of the 3 arms
x = [0 2 3.5 4.5];
y = [0 0 0 0];

% Draw lines in initial positions
l = line(x, y);
axis([-6 6 -6 6]);

% I am assuming the reference frames' x axes along the length of
% the links for each link.

% Parameters t1, t2, t3 are the joint angles.
% t1 = input('Enter theta 1 in degrees\n');
% t2 = input('Enter theta 2 in degrees\n');
% t3 = input('Enter theta 3 in degrees\n');
t1 = 120;
t2 = 220;
t3 = 350;
t1 = t1 * (pi / 180);
t2 = t2 * (pi / 180);
t3 = t3 * (pi / 180);

% angles between previous and next x axes are denoted by theta.
theta1 = t1;
theta2 = t2 - pi;
theta3 = t3 - pi;

% Product of all 3 angles will be a multiple of LCM of 3 angles
theta = theta1 * theta2 * theta3;

if theta < 0
    theta = -theta;
end

% Running a for loop to obtain animation

for i = 0 : 0.001 : theta
    
    tt1 = (i * theta1) ./ (theta);
    tt2 = (i * theta2) ./ (theta);
    tt3 = (i * theta3) ./ (theta);

    % transformation matrices

    % rotation matrices
    R1 = Rotate(tt1);
    R2 = Rotate(tt2);
    R3 = Rotate(tt3);

    % translation matrices
    % parameters are link lengths
    T2 = Translate(2);
    T3 = Translate(1.5);
    T4 = Translate(1);

    % finding second point
    Y = R1 * T2;
    Y1 = Y * [0; 0; 0; 1];
    x(2) = Y1(1);
    y(2) = Y1(2);

    % finding third point
    Y = R1 * T2 * R2 * T3;
    Y1 = Y * [0; 0; 0; 1];
    x(3) = Y1(1);
    y(3) = Y1(2);

    % finding fourth point
    Y = R1 * T2 * R2 * T3 * R3 * T4;
    Y1 = Y * [0; 0; 0; 1];
    x(4) = Y1(1);
    y(4) = Y1(2);

    % display points and lengths of arms
    % to verify that joint length does not change.
    % length1 = (((x(1) - x(2)) .^ 2) + ((y(1) - y(2)) .^ 2)) .^ (0.5);
    % length2 = (((x(3) - x(2)) .^ 2) + ((y(3) - y(2)) .^ 2)) .^ (0.5);
    % length3 = (((x(3) - x(4)) .^ 2) + ((y(3) - y(4)) .^ 2)) .^ (0.5);
    % disp(length1);
    % disp(length2);
    % disp(length3);
    delete(l);
    l = line(x, y);
    axis([-6 6 -6 6]);
    pause(0.001);
end