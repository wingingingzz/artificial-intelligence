%% Q2a
% Run functions which are named "Q2a_AllAttributes", "Q2a_RemovedFeatures",
% "Q2a_PCA" to get accuracies of each case and display them.
% Use 50 folds for cross-validation and keep the other default options proposed in the app.

[~, accuracy_allattr] = Q2a_AllAttributes(dataTrain); % accuracy of case "Use all the attributes in inputs"
[~, accuracy_remove3features] = Q2a_RemovedFeatures(dataTrain); % accuracy of case "except the 3 most correlated attributes"
[~, accuracy_pca] = Q2a_PCA(dataTrain); % accuracy of case "Apply PCA"

% display the results
disp("All attributes:");
disp(accuracy_allattr);
disp("Remove 3 features:");
disp(accuracy_remove3features);
disp("PCA:");
disp(accuracy_pca);