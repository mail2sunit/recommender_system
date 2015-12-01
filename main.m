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

num_restaurants = size(res_ratings_matrix,1);
num_users = size(res_ratings_matrix,2);
num_features = size(res_feature_matrix,2)+1;
Y = res_ratings_matrix;
R = check_matrix;

epsilon_init = 0.12;
Theta = [res_customer_matrix rand(num_users, 8)*2*epsilon_init - epsilon_init];
X = [res_feature_matrix rand(num_restaurants, 12)*2*epsilon_init - epsilon_init];

x = X(:,9:end);
theta = Theta(:,13:end);
[J ,grad] = costfunction([x(:) ; theta(:)], X, Theta, Y, R, num_users, num_restaurants, num_features, 1.5);

fprintf('\nCost at loaded parameters == %f',J);

fprintf('\n\nChecking Gradients with regularisation\n');

checkcostfunction;

initial_parameters = [x(:); theta(:)];

options = optimset('GradObj', 'on', 'MaxIter', 100);

lambda = 0.00000001;
theta = fmincg (@(t)(costfunction(t, X, Theta, Y, R, num_users, num_restaurants, num_features, lambda)), initial_parameters, options);


X = reshape(theta(1:num_restaurants*12), num_restaurants, 12);
Theta = reshape(theta(num_restaurants*12+1:end),num_users, 8);

fprintf('Recommender system learning completed.\n');

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%predictions
