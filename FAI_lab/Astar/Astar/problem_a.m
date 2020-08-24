% Define a 2-D map arrary to store the coordinates of the map and the objects
MAX_X = 20;
MAX_Y = 20;
MAP = 2 * (ones(MAX_X, MAX_Y));

% Obtain Obstacle, Target and Robot Position
% MAP with input values: Obstacle = -1, Target = 0, Robot = 1, Space = 2
x_val = 1;
y_val = 1;
axis([1 MAX_X+1 1 MAX_Y+1]) % ͼ�ķ�Χ
grid on; % on:��ʾ����������
set(gca, 'XTick', 1:21/21:21);
set(gca, 'YTick', 1:21/21:21); % �����������ܶȣ���Χ1-21/21��Ϊ21��,ÿ�γ�1
%grid off; % off:��������������
hold on; % ����»�ͼʱ������ǰ��ͼ

% Target location selection
pause(1); % ��ʱִֹͣ�� MATLAB ���ȴ��û����������

xlabel('Select Target: Left mouse click', 'Color', 'red'); % x�� "Select Target: Left mouse click" ��ɫΪ��ɫ
but = 0; % but = button
while (but ~= 1) % Repeat until the Left button is not clicked (but = 1: left button is clicked)
    [xval, yval, but] = ginput(1);
    % [x,y,button] = ginput(n) �ӵ�ǰ����ͼʶ��n���㣬������n�������������ֵ��x��y�ͼ���ť�ı�ʾ��button������button��һ��������������ʾ�û�������һ�������򷵻�ASCII��ֵ��
end
xval = floor(xval); % �������뵽С�ڻ���ڸ�Ԫ�ص���ӽ�������
yval = floor(yval);
xTarget = xval; % ȷ��Target�����꣨floor���ֵ��
yTarget = yval;
MAP(xval, yval) = 0; % Target = 0������map�иø��ֵ
plot(xval + .5, yval + .5, 'gd'); % plot Target; 'gd'Ϊ�����״/��ɫ��
text(xval + 1, yval + .5, 'Target') % �ڵ��Ա߱�text 'Target'

% Obstacle location selection
pause(1);
xlabel('Select Obstacles: Left mouse click; Last obstacle: Right mouse click', 'Color', 'blue');
while but == 1 % ��obtacle,ֱ����겻�����
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
while (but ~= 1) % ����갴�����ȷ��start location������ѭ��
    [xval, yval, but] = ginput(1);
    xval = floor(xval);
    yval = floor(yval);
end
xStart = xval; % ȷ��start location������
yStart = yval;
MAP(xval, yval) = 1; % Robot = 1��start location
plot(xval + .5,yval + .5,'bo'); % plot the Start