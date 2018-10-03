%% Base code from Andrew NG Machine Learning 
%  
% Cost function value (aplha = 0.01) J = 11.531611
% Cost function for Normal Equation was J = 12.0830
%
%
% Cost function value (aplha = 0.001) J = 47.823748
% Cost function value (aplha = 0.001) J = 47.823748
% Cost function value (aplha = 0.001) J = 47.823748


clear ; close all; clc

%% Load Data
data = csvread('boston_housing_data.csv');
X = data(:, 1:13);
y = data(:, 14);
m = length(y);

%Normalizing Features

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];

% Choose some alpha value
alpha = 0.1;
num_iters = 620;

% Init Theta and Run Gradient Descent 
theta = zeros(14, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

fprintf(['Cost function value is %f \n'], J_history(end));

% Estimate the price from test cases

input = [0.0101, 30, 5.19, 0, 0.0493, 6.059,37.3, 4.8122,1, 430,19.6, 375.21, 8.51];
[normalizedInput] = (input - mu)./sigma;
normalizedInput = [1, normalizedInput];
price = normalizedInput * theta;
fprintf(['Predicted price  for first case is $%f\n'], price);


input =  [ 0.02501, 35, 4.15, 1, 0.77, 8.78, 81.3, 2.5051, 24, 666, 17, 382.8, 11.48 ];
normalizedInput = (input - mu)./sigma;
normalizedInput = [1, normalizedInput];
price = normalizedInput * theta;

fprintf(['Predicted price  for second case is $%f\n'], price);

input = [ 3.67822, 0, 18.1, 1, 0.7, 6.649, 98.8, 1.1742, 24, 711, 20.2, 398.28, 18.07 ];
normalizedInput = (input - mu)./sigma;
normalizedInput = [1, normalizedInput];
price = normalizedInput * theta;

fprintf(['Predicted price  for third case is $%f\n'], price);