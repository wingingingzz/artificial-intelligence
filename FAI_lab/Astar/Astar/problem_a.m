% Define a 2-D map arrary to store the coordinates of the map and the objects
MAX_X = 20;
MAX_Y = 20;
MAP = 2 * (ones(MAX_X, MAX_Y));

% Obtain Obstacle, Target and Robot Position
% MAP with input values: Obstacle = -1, Target = 0, Robot = 1, Space = 2
x_val = 1;
y_val = 1;
axis([1 MAX_X+1 1 MAX_Y+1]) % 图的范围
grid on; % on:显示轴线网格线
set(gca, 'XTick', 1:21/21:21);
set(gca, 'YTick', 1:21/21:21); % 设置网格线密度：范围1-21/21分为21格,每段长1
%grid off; % off:隐藏轴线网格线
hold on; % 添加新绘图时保留当前绘图

% Target location selection
pause(1); % 暂时停止执行 MATLAB 并等待用户按下任意键

xlabel('Select Target: Left mouse click', 'Color', 'red'); % x轴 "Select Target: Left mouse click" 颜色为红色
but = 0; % but = button
while (but ~= 1) % Repeat until the Left button is not clicked (but = 1: left button is clicked)
    [xval, yval, but] = ginput(1);
    % [x,y,button] = ginput(n) 从当前坐标图识别n个点，返回这n个点的坐标向量值到x，y和键或按钮的标示到button。参数button是一个整数向量，显示用户按下哪一个鼠标键或返回ASCII码值。
end
xval = floor(xval); % 四舍五入到小于或等于该元素的最接近整数。
yval = floor(yval);
xTarget = xval; % 确定Target的坐标（floor后的值）
yTarget = yval;
MAP(xval, yval) = 0; % Target = 0，设置map中该格的值
plot(xval + .5, yval + .5, 'gd'); % plot Target; 'gd'为点的形状/颜色等
text(xval + 1, yval + .5, 'Target') % 在点旁边标text 'Target'

% Obstacle location selection
pause(1);
xlabel('Select Obstacles: Left mouse click; Last obstacle: Right mouse click', 'Color', 'blue');
while but == 1 % 标obtacle,直到鼠标不按左键
    [xval, yval, but] = ginput(1);
    xval = floor(xval);
    yval = floor(yval);
    MAP(xval, yval) = -1; % Obstacle = -1
    plot(xval + .5, yval + .5, 'ro'); % plot the Obstacles
end
pause(1);

% Start location selection
xlabel('Select initial position: Left mouse click', 'Color', 'black');
but = 0;
while (but ~= 1) % 当鼠标按左键，确定start location，跳出循环
    [xval, yval, but] = ginput(1);
    xval = floor(xval);
    yval = floor(yval);
end
xStart = xval; % 确定start location的坐标
yStart = yval;
MAP(xval, yval) = 1; % Robot = 1，start location
plot(xval + .5,yval + .5,'bo'); % plot the Start