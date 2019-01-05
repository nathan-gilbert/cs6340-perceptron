function e = compute_error_rate(w, data)
  %% Use the predictive weights w to make predictions about each
  %% example in data.  e should store the error rate (i.e., number of
  %% errors divided by number of examples).
  
  N = size(data,1);
  error_count = 0;
  
	for n=1:N
		y = data(n,1);
		x = data(n, 2:end);

		%% compute whether there's an error or not..
		if y*x*w' <= 0 
			error_count = error_count + 1;
		end
  end
  
  e = error_count / N;

end  
