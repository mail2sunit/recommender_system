function [J, grad] = costfunction(params, X, Theta, Y, R, num_users, num_restaurants,num_features, lambda)

%X = reshape(params(1:num_restaurants*num_features), num_restaurants, num_features);

%Theta = reshape(params(num_restaurants*num_features+1:end),num_users, num_features);
X_fix = X(:,1:8);
X_cf = reshape(params(1:12*num_restaurants), num_restaurants, 12);
Theta_fix = Theta(:,1:12);
Theta_cf = reshape(params(12*num_restaurants+1:end), num_users, 8);

h = X*Theta';

error = (h-Y).^2;

J = 0.5 * (sum(sum(error.*R))) + lambda*(sum(sum(Theta_cf.^2))) + lambda*(sum(sum(X_cf.^2)));

Theta_grad = ((h-Y).*R)' * X(:,13:end) + lambda*Theta_cf;
X_grad = ((h-Y).*R)*Theta(:,9:end) + lambda*X_cf;

grad = [X_grad(:);Theta_grad(:)];
end