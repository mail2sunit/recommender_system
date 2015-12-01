fprintf('Loading restaurant ratings dataset.\n\n');

%  Load data
load ('res_feature_matrix.mat');
load ('res_customer_matrix.mat');
load ('res_ratings_matrix.mat');
load ('check_matrix.mat');
imagesc(res_ratings_matrix);
xlabel('Users');
ylabel('Restaurants');

fprintf('\nProgram paused. Press Enter to continue...\n');
pause;

num_restaurants = size(res_ratings_matrix,1);       %returns the number of rows of res_ratings_matrix
num_users = size(res_ratings_matrix,2);             %returns number of columns of res_ratings_matrix
num_features = size(res_feature_matrix,2)+size(res_customer_matrix,2);
Y = res_ratings_matrix;
R = check_matrix;

epsilon_init = 0.12;                                %for initialisation using random values within this range
X = [res_feature_matrix, rand(num_restaurants, num_features-size(res_feature_matrix,2))*2*epsilon_init - epsilon_init];
Theta = [rand(num_users, num_features-size(res_customer_matrix,2))*2*epsilon_init - epsilon_init, res_customer_matrix];

%X = [res_feature_matrix, rand(num_restaurants, num_features-size(res_feature_matrix,2))];
%Theta = [rand(num_users, num_features-size(res_customer_matrix,2)), res_customer_matrix];
lambda = 1.5;                                       % parameter for regularisation,(its value can be different)

%costfunction returns the cost and gradient, where X and Theta has to be
%passed as vectors
[J ,grad] = costfunction([X(:) ; Theta(:)], X, Theta, Y, R, num_users, num_restaurants, num_features, res_feature_matrix, res_customer_matrix,lambda);

fprintf('\nCost at loaded parameters == %f',J);

%fprintf('\n\nChecking Gradients with regularisation\n');

%checkcostfunction(lambda);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

initial_parameters = [X(:); Theta(:)];

options = optimset('GradObj', 'on', 'MaxIter', 100);

%optimization function that uses Wolfe-Powells technique to find the minima
theta = fmincg (@(t)(costfunction(t, X, Theta, Y, R, num_users, num_restaurants, num_features, res_feature_matrix, res_customer_matrix,lambda)), initial_parameters, options);

X = reshape(theta(1:num_restaurants*num_features), num_restaurants, num_features);
Theta = reshape(theta(num_restaurants*num_features+1:end),num_users, num_features);

fprintf('Recommender system learning completed.\n');
[J ,grad] = costfunction([X(:) ; Theta(:)], X, Theta, Y, R, num_users, num_restaurants, num_features, res_feature_matrix, res_customer_matrix, lambda);

fprintf('Cost after learning ----> %f\n',J);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

predictions = X*Theta';
userprediction = predictions(:,1);              %prediction of ratings of all restaurants by customer 1
[r, ix] = sort(userprediction,'descend');
content_collaborative_recommend = ix(1:20);     %taking top 20 restaurants 
fprintf('\n Top twenty recommended restaurants are');
for k=1:20
    fprintf('\n Restaurant %d rating %f',ix(k),r(k))
end
fprintf('\n')
    
