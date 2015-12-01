
%  Load data
load ('res_feature_matrix.mat');
load ('res_customer_matrix.mat');
load ('res_ratings_matrix.mat');
load ('check_matrix.mat');

num_restaurants = size(res_ratings_matrix,1);
num_users = size(res_ratings_matrix,2);
num_features = 20;
Y = res_ratings_matrix;
R = check_matrix;
lambda = 1.5;
epsilon_init = 0.12;
X = rand(num_restaurants, num_features)*2*epsilon_init - epsilon_init;
Theta = rand(num_users, num_features)*2*epsilon_init - epsilon_init;
checkcostfunction();
initial_parameters = [X(:); Theta(:)];
options = optimset('GradObj', 'on', 'MaxIter', 100);
theta = fmincg (@(t)(costfunction(t, Y, R, num_users, num_restaurants,num_features, lambda)), initial_parameters, options);
X = reshape(theta(1:num_restaurants*num_features), num_restaurants, num_features);
Theta = reshape(theta(num_restaurants*num_features+1:end),num_users, num_features);
predictions = X*Theta';
userprediction = predictions(:,12);
[r,ix] = sort(userprediction,'descend');
fprintf('\n Top five recommended restaurants');
restaurant_list = loadrest();
for k=1:5
    fprintf('\n %s rating %f',restaurant_list{ix(k)}, r(k));
end
fprintf('\n');
