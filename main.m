function main
    %% first, load the data
    train = load('train');
    dev   = load('dev');
    test  = load('test');
    t = '';

    %% each of train/dev/test is an Nx(D+1) matrix, where N is
    %% the number of examples and D is the dimensionality
    %% (D is constant for all 3, but N is not).  The first column (i.e.,
    %% train(:,1)) is the label (+/- 1).

    %% for part one, we may want to normalize (uncomment one
    %% of the following lines)
    data = input('How do you prefer your data? [R]aw, [L1] Normalized, or [L2] Normalized: ', 's');
    if(strcmp('L1',data))
        [train,dev,test] = normalize_l1(train, dev, test);
        t = strcat(t,'L1 Normalized ');
    end

    if(strcmp('L2', data))
        [train,dev,test] = normalize_l2(train,dev,test);
        t = strcat(t, 'L2 Normalized ');
    end

    in = input('Which test would you like to run? [P]erceptron or [L]ogisitic Regression: ','s');
    if(strcmp('P', in))
        %% regardless, we now want to run a perceptron:
        [PredRaw, PredAvg] = perceptron(train, dev, test);

        t = strcat(t, ' Perceptron');

        %% plot the results
        figure(1);

        plot(1:20, PredRaw(1,:), 'b:', ...
             1:20, PredRaw(2,:), 'g:', ...
             1:20, PredRaw(3,:), 'k:',...
             1:20, PredAvg(1,:), 'b-', ...
             1:20, PredAvg(2,:), 'g-', ...
             1:20, PredAvg(3,:), 'k-');
        legend('Train err (raw)', 'Dev err (raw)', 'Test err (raw)', ...
               'Train err (avg)', 'Dev err (avg)', 'Test err (avg)');
        title(t);
        xlabel('Trials');
        ylabel('Error %');
    else
        PredRaw = logistic_regression(train,dev,test);
        t = strcat(t, ' Logistic Regression');

        %% plot the results
        figure(1);
        plot(1:20, PredRaw(1,:), 'b-', ...
             1:20, PredRaw(2,:), 'g-', ...
             1:20, PredRaw(3,:), 'k-');
        legend('Train err (raw)', 'Dev err (raw)', 'Test err (raw)');
        title(t);
        xlabel('Trials');
        ylabel('Error %');
    end
end
