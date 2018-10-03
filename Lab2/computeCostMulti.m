function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

J = 0;

hypothesis = X * theta;
errors = hypothesis .- y;
squareOfErrors = (errors).^2;
sumOfSquareErrors = sum(squareOfErrors);
J = 1/(2 * m) * sumOfSquareErrors;

end
