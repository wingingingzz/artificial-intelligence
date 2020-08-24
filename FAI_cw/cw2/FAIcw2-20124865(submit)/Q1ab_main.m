clc
clear
close all

%% Q1a
dataTrain = readtable("cancer_train.csv"); % Load the data from cancer_train.csv as a table
dataTrain(:,1) = []; % delete first column id

dataTrain(any(ismissing(dataTrain),2),:) = []; % delete all rows with NaN in cancerTrain

dataTrain.diagnosis(strcmp(dataTrain.diagnosis,'B')) = {'0'}; % replace 'B' with char '0'
dataTrain.diagnosis(strcmp(dataTrain.diagnosis,'M')) = {'1'}; % replace 'M' with char '1'

dataTrain.diagnosis = cellstr(dataTrain.diagnosis);
dataTrain.diagnosis = str2double(dataTrain.diagnosis); % convert diagnosis from cell to double

inputs = table2array(dataTrain(:,2:31)); % set inputs
targets = table2array(dataTrain(:,1)); % set targets

% number of row
[MAX_row,MAX_col] = size(dataTrain);
disp('The number of row is');
disp(MAX_row);

% mean and std of radius_mean
disp('The mean of radius_mean is');
mean_r = mean(dataTrain.radius_mean);
disp(mean_r);
disp('The std of radius_mean is');
std_r = std(dataTrain.radius_mean);
disp(std_r);

% standarlize
% std_cancerTrain = normalize(dataTrain(:,2:MAX_col),'range'); % standardize all numeric attributes to range [0,1]
std_cancerTrain = normalize(dataTrain(:,2:MAX_col)); % standardize all numeric attributes
dataTrain(:,2:MAX_col) = std_cancerTrain;

%% Q1b
correlation = corr(inputs); % correlation 
correlation(:,end + 1) = mean(correlation);
correlation(:,end + 1) = 1:MAX_col-1;
sort_corr = sortrows(correlation, MAX_col,'descend'); % sort matrix using one of the cols
max_corr = sort_corr(1:3,MAX_col + 1); 
% the names of the 3 attributes that are the most correlated to the other attributes on average
disp('the names of the 3 attributes that are the most correlated to the other attributes on average:');
attr_name = string(dataTrain.Properties.VariableNames(1,max_corr(:,1) + 1)); 
disp(attr_name);
