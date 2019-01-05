function [newTrain,newDev,newTest] = normalize_l2(train,dev,test)
  %% Here, noramlize all of these identically so they have the
  %% same l2 norm.  The matrix sizes should remain the same.  Be sure
  %% that you don't mess with the first column, since these are
  %% the class ids.
    
   newTrain = train;
   newDev   = dev;
   newTest  = test;

	for i = 1:size(train,1)
  		newTrain(i, 2:end) = (train(i, 2:end) / sqrt(sum(train(i, 2:end).^2)));
	end

	for i = 1:size(dev,1)
  		newDev(i, 2:end) = (dev(i, 2:end) / sqrt(sum(dev(i, 2:end).^2)));
	end
  
	for i = 1:size(test,1)
  		newTest(i, 2:end) = (test(i, 2:end) / sqrt(sum(test(i, 2:end).^2)));
	end
end
