close all

%% initialize array to store accuracy of each case
accuracy_75 = [];
accuracy_80 = [];
accuracy_85 = [];
accuracy_90 = [];
accuracy_95 = [];
accuracy_100 = [];

%% run each functions for 30 times
for i = 1:1:30
    [~,accuracy_75(i)] = Q2b_PCA75(dataTrain); % accuracy of PCA with 75% variance
end

for i = 1:1:30
    [~,accuracy_80(i)] = Q2b_PCA80(dataTrain); % accuracy of PCA with 80% variance
end

for i = 1:1:30
    [~, accuracy_85(i)] = Q2b_PCA85(dataTrain); % accuracy of PCA with 85% variance
end

for i = 1:1:30
    [~, accuracy_90(i)] = Q2b_PCA90(dataTrain); % accuracy of PCA with 90% variance
end

for i = 1:1:30
    [~, accuracy_95(i)] = Q2b_PCA95(dataTrain); % accuracy of PCA with 95% variance
end

for i = 1:1:30
    [~, accuracy_100(i)] = Q2b_PCA100(dataTrain); % accuracy of PCA with 100% variance
end

%% calculate average of 30 times
acc_75 = mean(accuracy_75);
acc_80 = mean(accuracy_80);
acc_85 = mean(accuracy_85);
acc_90 = mean(accuracy_90);
acc_95 = mean(accuracy_95);
acc_100 = mean(accuracy_100);

%% Plot the accuracy obtained after training against varying values for
% the percent of variance explained in PCA (use 75%, 80%, … 95%, 100%)
X = [75 80 85 90 95 100];
Y = [acc_75 acc_80 acc_85 acc_90 acc_95 acc_100];

plot(X,Y);
grid on;
xlabel('variance (%)')
ylabel('accuracy (%)')