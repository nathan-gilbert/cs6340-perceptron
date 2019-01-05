function [PredRaw, PredAvg] = perceptron(train,dev,test)
  	%% Initalize the weights:
  	w = zeros(1,34);
  
  	%% Initialize the averaged weights:
  	avg = w;
  
  	%% Initialize the predicted error.  PredRaw(1,i) should be the error
  	%% rate on the training data on iteration i using w; PredRaw(2,i)
  	%% should be the same for the dev data and PredRaw(3,i) should be for
  	%% the test data.  PredAvg should be the same except for avg instead of
  	%% just w.  We'll run 20 iterations total.
  
  	PredRaw = zeros(3,20);
	PredAvg = zeros(3,20);
  
 	%% Begin the iterations
  	for i=1:20
		%% First, loop over all the training examples, making corrections to
    	%% the weight vector as necessary.  Be sure to perform weight
    	%% averaging within this loop.
		for j = 1:size(train,1)
			y = train(j,1);
			x = train(j,2:end);

			if y*x*w' <= 0
				w = w + y*x;
			end	
        end
        
        avg = (avg + w) / i;

        %% Next, make our predictions and compute error rates
        PredRaw(1,i) = compute_error_rate(w, train);
        PredRaw(2,i) = compute_error_rate(w, dev);
        PredRaw(3,i) = compute_error_rate(w, test);
        
        PredAvg(1,i) = compute_error_rate(avg, train);
	     PredAvg(2,i) = compute_error_rate(avg, dev);
        PredAvg(3,i) = compute_error_rate(avg, test);
	end
end
