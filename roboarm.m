% Initial points of the 3 arms
x = [0 0 1 1];
y = [0 1 1 0];

% Draw lines in initial positions
for i = 1 : 3
    line([x(i), y(i)], [x(i + 1), y(i + 1)]);
    axis([-4 4 -4 4]);
end