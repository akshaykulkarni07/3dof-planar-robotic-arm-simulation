% Initial points of the 3 arms
x = [0 0 1 1];
y = [0 1 1 0];

% Draw lines in initial positions
for i = 1 : 3
    line([x(i), y(i)], [x(i + 1), y(i + 1)]);
    axis([-4 4 -4 4]);
end
th = 60;
% Transformation matrix
T = [cosd(th) -sind(th) 0 0;
    sind(th) cosd(th) 0 1;
    0 0 1 0;
    0 0 0 1];
z1 = 0;
z2 = 1;
Y = [x(1) y(1) 0 1] * T;
x(1) = Y(1);
y(1) = Y(2);
Y = [x(1) y(1) 0 1] * T;
x(2) = Y(1);
y(2) = Y(2);
Y = [x(1) y(1) 0 1] * T;
x(3) = Y(1);
y(3) = Y(2);
fprintf('%u/t%u\n', x(1), y(1));
for i = 1 : 3
    line([x(i), y(i)], [x(i + 1), y(i + 1)]);
    axis([-4 4 -4 4]);
end