function distance = h2(x1, y1, x2, y2)
x_abs = abs(x2 - x1);
y_abs = abs(y2 - y1);
distance = sqrt(2 * (min(x_abs, y_abs) ^ 2)) + abs(x_abs - y_abs);
end