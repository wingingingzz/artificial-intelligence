close all

%% initialize array to store test errors of each case
err_5 = [];
err_10 = [];
err_15 = [];
err_20 = [];
err_25 = [];
err_30 = [];

%% run each scripts for 30 times
for i = 1:1:30
    Q2c_5hiddennodes;
    err_5(i) = test_error_5; % test error with 5 hidden nodes
    Q2c_10hiddennodes;
    err_10(i) = test_error_10; % test error with 10 hidden nodes
    Q2c_15hiddennodes;
    err_15(i) = test_error_15; % test error with 15 hidden nodes
    Q2c_20hiddennodes;
    err_20(i) = test_error_20; % test error with 20 hidden nodes
    Q2c_25hiddennodes;
    err_25(i) = test_error_25; % test error with 25 hidden nodes
    Q2c_30hiddennodes;
    err_30(i) = test_error_30; % test error with 30 hidden nodes
end

%% calculate average of 30 times
avg_err_5 = mean(err_5);
avg_err_10 = mean(err_10);
avg_err_15 = mean(err_15);
avg_err_20 = mean(err_20);
avg_err_25 = mean(err_25);
avg_err_30 = mean(err_30);

%% Plot the error obtained with a trained neural network with varying number of
% hidden nodes (use 5, 10, 15, 20, 25, 30)
X = [5, 10, 15, 20, 25, 30];
Y = [avg_err_5 avg_err_10 avg_err_15 avg_err_20 avg_err_25 avg_err_30];

plot(X,Y);
grid on
xlabel('number of hidden nodes')
ylabel('test error')