function checkcostfunction(lambda)
%CHECKCOSTFUNCTION Creates a collaborative filering problem 
%to check your cost function and gradients
%   CHECKCOSTFUNCTION(lambda) Creates a collaborative filering problem 
%   to check your cost function and gradients, it will output the 
%   analytical gradients produced by your code and the numerical gradients 
%   (computed using computeNumericalGradient). These two gradient 
%   computations should result in very similar values.

% Set lambda
if ~exist('lambda', 'var') || isempty(lambda)
    lambda = 0;
end

%% Create small problem
X_t = rand(130, 20);
Theta_t = rand(138, 20);

% Zap out most entries
Y = X_t * Theta_t';
Y(rand(size(Y)) > 0.5) = 0;
R = zeros(size(Y));
R(Y ~= 0) = 1;

%% Run Gradient Checking
X = randn(size(X_t));
Theta = randn(size(Theta_t));
num_users = size(Y, 2);
num_restaurants = size(Y, 1);
num_features = size(Theta_t, 2);

x = X(:,9:end);
theta = Theta(:,13:end);

[cost, grad] = costfunction([x(:); theta(:)], X, Theta, Y, R, num_users, num_restaurants, num_features, lambda);

numgrad = computeNumericalGradient(@(t)costfunction(t, X, Theta, Y, R, num_users, num_restaurants, num_features, lambda),  [x(:);theta(:)], num_restaurants, num_users, num_features);



disp([numgrad(1:10) grad(1:10)]);
fprintf(['The above two columns you get should be very similar.\n' ...
         '(Left-Your Numerical Gradient, Right-Analytical Gradient)\n\n']);

diff = norm(numgrad-grad)/norm(numgrad+grad);
fprintf(['If your backpropagation implementation is correct, then \n' ...
         'the relative difference will be small (less than 1e-9). \n' ...
         '\nRelative Difference: %g\n'], diff);

end