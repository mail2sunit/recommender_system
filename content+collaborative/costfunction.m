function [J, grad] = costfunction(params, X, Theta, Y, R, num_users, num_restaurants,num_features,res_feature_matrix, res_customer_matrix, lambda)

%X = reshape(params(1:num_restaurants*num_features), num_restaurants, num_features);

%Theta = reshape(params(num_restaurants*num_features+1:end),num_users, num_features);
%X_fix = X(:,1:8);
X = reshape(params(1:num_features*num_restaurants), num_restaurants, num_features);
%Theta_fix = Theta(:,9:end);
Theta = reshape(params(num_features*num_restaurants+1:end), num_users, num_features);
Theta_cf = Theta(:,1:size(res_feature_matrix,2));   %cuttings out the variable parameters
X_cf = X(:,size(res_feature_matrix,2)+1:end);       %cutting out the variable parameters
h = X*Theta';                                       
error = (h-Y).^2;
J = 0.5 * (sum(sum(error.*R))) + lambda*(sum(sum(Theta_cf.^2))) + lambda*(sum(sum(X_cf.^2))); %squared error function

%calculation of X gradient and Theta gradient
Theta_grad = ((h-Y).*R)' * X + lambda*Theta;
X_grad = ((h-Y).*R)*Theta + lambda*X;

Theta_grad = [Theta_grad(:,1:size(res_feature_matrix,2)), zeros(num_users,size(res_customer_matrix,2))];
X_grad = [zeros(num_restaurants,size(res_feature_matrix,2)), X_grad(:,size(res_feature_matrix,2)+1:end)];

grad = [X_grad(:);Theta_grad(:)];
end