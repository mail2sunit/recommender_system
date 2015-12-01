function [J, grad] = costfunction(theta, X ,Y, R, num_users,num_features, lambda)

%X = reshape(params(1:num_restaurants*num_features), num_restaurants, num_features);

Theta = reshape(theta(1:end),num_users, num_features);
                
h = X*Theta';

error = (h-Y).^2;

J = 0.5 * (sum(sum(error.*R))) + lambda*(sum(sum(Theta.^2)));

for_theta_zero = [zeros(num_users,1) Theta(:,2:num_features)];
grad = ((h-Y).*R)' * X + lambda*for_theta_zero;

grad = grad(:);
end