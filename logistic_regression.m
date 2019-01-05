function PredRaw = logistic_regression(train,dev,test)

%% Initalize the weights:
w = zeros(1, 34);

%Initialize regularization hyperparameter.
alpha = 0.25;
lambda = 0.15;

%Initialize gradient.
grad_data = 0.0;
grad = 0.0;

%% Initialize the predicted error.  PredRaw(1,i) should be the error
%% rate on the training data on iteration i using w; PredRaw(2,i)
%% should be the same for the dev data and PredRaw(3,i) should be for
%% the test data.
PredRaw = zeros(3,20);

%% Begin the iterations
for i=1:20
    %% First, loop over all the training examples, making corrections to
    %% the weight vector as necessary.
    for j = 1:size(train,1)
        y = train(j,1);
        x = train(j,2:end);
        grad_data = grad_data + (sigmoid(-y*x*w'))*y*x;
    end

    %Calculating the regularized gradient.
    grad = grad_data - lambda*w;

    %Adjusting weights.
    w = w + alpha*grad;

    %% Next, make our predictions and compute error rates
    PredRaw(1,i) = compute_error_rate(w, train);
    PredRaw(2,i) = compute_error_rate(w, dev);
    PredRaw(3,i) = compute_error_rate(w, test);
end
end

