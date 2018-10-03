% Anishi Mehta - 201401439
%
% Cost Function: J = 12.0830
% Predicted Value: b = 14.9312


%input matrix
X = csvread('boston_housing_data.csv',  1, 0, [1 0 506 12]);

%output vector
Y = csvread('boston_housing_data.csv',  1, 13, [1 13 506 13]);

X_t = X.';

M = inv(X_t*X);

W = M*X_t*y;
 
H = X*W - Y;
Hsq = H.^2;
sum = sum(Hsq);
 
%value of cost function
cost = sum/(2*506);
 
%prediction values
a = [0.085, 13.0, 10.5, 1.0, 0.8, 4.78, 39.0, 5.5, 5.5, 331.0, 13.3, 390.5, 17.71];
b = a*W;
