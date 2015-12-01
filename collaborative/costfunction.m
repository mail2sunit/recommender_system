
function [J, grad] = costfunction(params, Y, R, num_users, num_restaurants, num_features, lambda)

%since paramas argument was passed as a vector so reshape is done to
%obtain X and Theta
X = reshape(params(1:num_restaurants*num_features),num_restaurants, num_features);
Theta = reshape(params(num_restaurants*num_features+1:end),num_users, num_features);
       
% calculating the hyposthesis fuction by vetor implementation
h = X*Theta';

error = (h-Y).^2;


J = 0.5 * (sum(sum(error.*R))) + lambda*(sum(sum(Theta.^2))) + lambda*sum(sum(X.^2));

%calculating gradients of hypothesis function by vectorised implementation
Theta_grad = ((h-Y).*R)' * X + lambda*Theta;
X_grad = ((h-Y).*R)*Theta + lambda*X;
grad = [X_grad(:); Theta_grad(:)];

end