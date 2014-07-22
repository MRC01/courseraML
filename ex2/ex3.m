%% ============= Part 2: Regularization and Accuracies =============
%  Optional Exercise:
%  In this part, you will get to try different values of lambda and 
%  see how regularization affects the decision coundart
%
%  Try the following values of lambda (0, 1, 10, 100).
%
%  How does the decision boundary change when you vary lambda? How does
%  the training set accuracy vary?
%

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 0.001;
while (lambda <= 100)
	% Set Options
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	
	% Optimize
	[theta, J, exit_flag] = ...
		fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);
	
	% Plot Boundary
	plotDecisionBoundary(theta, X, y);
	hold on;
	title(sprintf('lambda = %g', lambda))
	
	% Labels and Legend
	xlabel('Microchip Test 1')
	ylabel('Microchip Test 2')
	
	legend('y = 1', 'y = 0', 'Decision boundary')
	hold off;
	
	% Compute accuracy on our training set
	p = predict(theta, X);
	
	fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

	lambda *= 10;
end

