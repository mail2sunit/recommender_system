fprintf('Loading restaurant ratings dataset.\n\n');

%  Load data
load ('res_feature_matrix.mat');
load ('res_ratings_matrix.mat');
load ('check_matrix.mat');

%res_feature_matrix=rand(130,99);
imagesc(res_ratings_matrix);
xlabel('Users');
ylabel('Restaurants');

fprintf('\nProgram paused. Press Enter to continue...\n');
pause;
Y = res_ratings_matrix;

num_restaurants = size(Y,1);
num_users = size(Y,2);
num_features = size(res_feature_matrix,2)+1;

epsilon_init = 0.12;
Theta = rand(num_users, num_features) * 2 * epsilon_init - epsilon_init;
X = [ones(num_restaurants,1) res_feature_matrix];

R = check_matrix;

lambda = 0.3;

[J ,grad] = costfunction([Theta(:)], X, Y, R, num_users, num_features, lambda);

fprintf('\nCost at loaded parameters == %f',J);

%fprintf('\n\nChecking Gradients with regularisation\n');

%checkcostfunction(lambda);

pause;
initial_parameters = [Theta(:)];

options = optimset('GradObj', 'on', 'MaxIter', 100);

theta = fmincg (@(t)(costfunction(t, X, Y, R, num_users, num_features, lambda)), initial_parameters, options);


%X = reshape(theta(1:num_restaurants*num_features), num_restaurants, num_features);
Theta = reshape(theta(1:end),num_users, num_features);

fprintf('Recommender system learning completed.\n');

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

R_testdata = check_matrix(101:end,:);
fprintf('Recommender system learning completed.\n');
[J ,grad] = costfunction([Theta(:)], X, Y, R, num_users, num_features, lambda);
fprintf('Cost after learning ----> %f\n',J);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

predictions = X*Theta';
userprediction = predictions(:,1);
[r, ix] = sort(userprediction,'descend');

fprintf('\n Top twenty recommended restaurants are');
for k=1:20
    fprintf('\n Restaurant %d rating %f',ix(k),r(k))
end
fprintf('\n')


%predictions

%fprintf('\nTraining Set Accuracy: %f\n', mean(double(prediction == Y_testdata)) * 100);