fprintf('Loading restaurant ratings dataset.\n\n');

%  Loading data from the given file
load ('res_feature_matrix.mat');
load ('res_ratings_matrix.mat');
load ('check_matrix.mat');

% visualise restaurant ratings matrix
imagesc(res_ratings_matrix);
xlabel('Users');
ylabel('Restaurants');

fprintf('\nProgram paused. Press Enter to continue...\n');
pause;

%Y = Restaurant Rating Matrix
Y = res_ratings_matrix;
num_restaurants = size(Y,1);
num_users = size(Y,2);
num_features = 40;

% Random initialisation of the Theta and X matrix
% Theta matrix is the parameters related to the users 
% X matrix is the parameters related to the restaurants

epsilon_init = 0.12;
Theta = rand(num_users, num_features)*2*epsilon_init - epsilon_init;
X = rand(num_restaurants, num_features)*2*epsilon_init - epsilon_init;

%X = [res_feature_matrix, rand(num_restaurants, num_features-size(res_feature_matrix,2))];
%Theta = [rand(num_users, num_features-size(res_customer_matrix,2)), res_customer_matrix];

R = check_matrix;

%lambda is used for regularistion i.e. to prevent the overfitting
lambda = 0.15;

%costfunction returns J(cost) and grad (gradient vector)
[J ,grad] = costfunction([X(:);Theta(:)], Y, R, num_users, num_restaurants, num_features, lambda);
fprintf('\nCost at loaded parameters == %f',J);
pause;

fprintf('\n\nChecking Gradients with regularisation\n');

% checkcostfucntion checks whether the gradients calculated by
% vectorisation are actually correct of not.
checkcostfunction(0);

fprintf('\nPress enter to continue\n');
pause;


initial_parameters = [X(:);Theta(:)];

options = optimset('GradObj', 'on', 'MaxIter', 100);

theta = fmincg (@(t)(costfunction(t, Y, R, num_users, num_restaurants, num_features, lambda)), initial_parameters, options);

% since the theta returned by fmincg is a vector hence repshaping is done
X = reshape(theta(1:num_restaurants*num_features), num_restaurants, num_features);
Theta = reshape(theta(num_restaurants*num_features+1:end),num_users, num_features);

fprintf('Recommender system learning completed.\n');
[J ,grad] = costfunction([X(:);Theta(:)], Y, R, num_users, num_restaurants, num_features, lambda);
fprintf('Cost after learning ----> %f\n',J);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

predictions = X*Theta';
userprediction = predictions(:,36);
[r, ix] = sort(userprediction,'descend');
collaborative_recommend = ix(1:20);
fprintf('\n Top twenty recommended restaurants are');
for k=1:20
    fprintf('\n Restaurant %d rating %f',ix(k),r(k))
end
fprintf('\n')
    

%predict = (X_testdata*Theta').*R_testdata;
%predictions

%fprintf('\nTraining Set Accuracy: %f\n', mean(double(prediction == Y_testdata)) * 100);