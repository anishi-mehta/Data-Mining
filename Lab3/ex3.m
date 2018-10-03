%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all
%
% Class 1: tested_positive
% Class 2: tested_negative

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 768;  
num_labels = 2;          

data = csvread('Pima_Diabetes.csv');
X = data(:, 1:8);
y = data(:, 9);
m = size(X, 1);

rand_indices = randperm(m);
train_set = X(rand_indices(1:390), :);
train_set_class = y(rand_indices(1:390), :);


lambda = 0.001;
[all_theta] = oneVsAll(train_set, train_set_class, num_labels, lambda)


test_set = X(rand_indices(391:end), :);
test_set_class = y(rand_indices(391:end), :);

pred = predictOneVsAll(all_theta, test_set);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == test_set_class)) * 100);

plot(X, y, 'rx','MarkerSize',8)

TP = 0;
TN = 0;
FP = 0;
FN = 0;

for i = 1:length(pred)
  if test_set_class(i) == 1
    if pred(i) == 1
      TP = TP + 1;
     else 
      FN = FN + 1;
     endif
  else
    if pred(i) == 1
      FP = FP + 1;
     else
      TN = TN + 1;
     endif
   endif
endfor

fprintf("TP = %f, TN = %f, FP = %f, FN = %f\n", TP, TN, FP, FN);


%
% Predicted tested_positive in all cases.
%

input =  [ 5 , 153, 76, 40, 120, 36.1, 0.471 ];
input = [1, input];
pred = predictOneVsAll(all_theta, input);
fprintf('\nCase 1:%0.0f\n', pred);

input = [ 4 , 90 , 70, 30 , 0, 35.7 , 0.27 ];
input = [1, input];
pred = predictOneVsAll(all_theta, input);
fprintf('\nCase 2:%0.0f\n', pred);

input = [ 5, 54, 70, 34, 0, 30.8, 0.090 ];
input = [1, input];
pred = predictOneVsAll(all_theta, input);
fprintf('\nCase 3:%0.0f\n', pred);