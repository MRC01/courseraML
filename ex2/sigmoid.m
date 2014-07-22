function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

% This works whether z is a scalar or matrix
% Must put '.' after scalars to force them to be such,
%	else it will fail when z is matrix
g = 1./(1.+e.^(-z));   

% =============================================================

end
