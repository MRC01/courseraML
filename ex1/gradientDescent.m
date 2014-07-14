function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    tmp = zeros(2,1);
    for dim=1:2
		s1 = 0;
		for i=1:m
			h1 = theta(1,1) + theta(2,1) * X(i,2);
			h2 = X(i,:) * theta;
			delta = h2 - y(i);
			s1 = s1 + delta * X(i,dim);
		end;
		tmp(dim) = theta(dim) - (alpha * s1 / m);
	end;
	for dim=1:2
		theta(dim,1) = tmp(dim);
	end;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
end

end
