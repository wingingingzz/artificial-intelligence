%% define the problem via GUI
clf; % 清空当前图窗窗口
problem(); % 确定 target, obtacles, start location 坐标

% OBSTACLE: [X val, Y val]
OBSTACLE = []; % 定义一个空矩阵，存obstacle的坐标
k = 1;
for i = 1 : MAX_X % 1->MAX_X 循环，默认step = 1
    for j = 1 : MAX_Y
        if(MAP(i, j) == -1) % obstacle = -1
            OBSTACLE(k, 1) = i; % 若是obstacle, x轴坐标写入矩阵OBSTACLE第一列中
            OBSTACLE(k, 2) = j; % y轴坐标写入矩阵OBSTACLE第二列中
            k = k + 1; 
        end
    end
end
OBST_COUNT = size(OBSTACLE, 1); % obstacle的数量
OBST_COUNT = OBST_COUNT + 1;
OBSTACLE(OBST_COUNT, :) = [xStart, yStart]; % 在obstacle的最后一行写入start location的x,y轴坐标

%% add the starting node as the first node (root node) in QUEUE
% QUEUE: [0/1, X val, Y val, Parent X val, Parent Y val, g(n), h(n), f(n)]
% QUEUE 存已在树里的node
xNode = xStart; % root node 是 start location
yNode = yStart;
QUEUE = []; % 定义一个空矩阵，存 QUEUE
QUEUE_COUNT = 1; % 第一行
NoPath = 1; % assume there exists a path
path_cost = 0; % cost g(n): start node to the current node n
% g(n) = current node 和 root node 之间的距离
goal_distance = distance(xNode, yNode, xTarget, yTarget); % cost h(n): heuristic cost of n
% h(n) = current node 和 Target 之间的距离
QUEUE(QUEUE_COUNT, :) = insert(xNode, yNode, xNode, yNode, path_cost, goal_distance, goal_distance); % 将初始情况写入QUEUE
QUEUE(QUEUE_COUNT, 1) = 0; % What does this do? 0->expanded, 1->not expanded

%% Start the search
while((xNode ~= xTarget || yNode ~= yTarget) && NoPath == 1) % 目前坐标不等于Target 并且 there exists a path 继续search
    
    % expand the current node to obtain child nodes
    exp = expand_Greedy(xNode, yNode, path_cost, xTarget, yTarget, OBSTACLE, MAX_X, MAX_Y);
    exp_count  = size(exp, 1); % expanded nodes 的个数
    % Update QUEUE with child nodes; exp: [X val, Y val, g(n), h(n), f(n)]
    for i = 1 : exp_count
        QUEUE_COUNT = QUEUE_COUNT + 1;
        QUEUE(QUEUE_COUNT, :) = insert(exp(i, 1), exp(i, 2), xNode, yNode, exp(i, 3), exp(i, 4), exp(i, 5));
    end;
 
    % Greedy: find the node in QUEUE with the smallest f(n), returned by min_fn
    index_min_node = min_fn(QUEUE, QUEUE_COUNT);
    if (index_min_node ~= -1)
        % set current node (xNode, yNode) to the node with minimum f(n)
        xNode = QUEUE(index_min_node, 2);
        yNode = QUEUE(index_min_node, 3);
        path_cost = QUEUE(index_min_node, 6); % cost g(n)
        % move the node to OBSTACLE, next time it cannot be expanded!
        OBST_COUNT = OBST_COUNT + 1;
        OBSTACLE(OBST_COUNT, 1) = xNode;
        OBSTACLE(OBST_COUNT, 2) = yNode;
        QUEUE(index_min_node, 1) = 0;
    else % index_min_node = -1 -> no path
        NoPath = 0; % there is no path!
    end;
end;

%% Output / plot your route
result();

%% Evaluation
% total path cost
QUEUE_COUNT = size(QUEUE, 1);
min_path = 0;
for i = 1 : QUEUE_COUNT
    if (QUEUE(i, 7) == 0 && min_path == 0)
        min_path = QUEUE(i, 6);
    end
    if (QUEUE(i, 7) == 0 && min_path ~= 0 && QUEUE(i, 6) < min_path)
        min_path = QUEUE(i, 6);
    end
end
total_path_cost = min_path

% number of nodes discovered
discovered_node = QUEUE_COUNT

% number of nodes expanded
COUNT_EXP = 0;
for i = 1 : QUEUE_COUNT
    if (QUEUE(i, 1) == 0)
        COUNT_EXP = COUNT_EXP + 1;
    end
end
expanded_node = COUNT_EXP