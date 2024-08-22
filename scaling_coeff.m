% Define fitting function
fit_function = @(params, x) params(1) .* x(:,1).* log(x(:,3)) + x(:,2).* params(2); %logarithmic function
fit_function = @(params, x)params(1).*x(:,1).* x(:,3).^(-x(:,2).*params(2)); %power function

params_all_depths = [];

% Define the depths to fit
depths = [5, 15, 30, 60, 100];

% Iterate over each depth and perform the fitting
for d = 1:length(depths)
  
    depth = depths(d);
    initialGuess = [1; 1];
    xdata(:,3) = depth;
    
    params = lsqcurvefit(fit_function, initialGuess, xdata, y);
    
    % Store the fitting parameters for the current depth
    params_all_depths = [params_all_depths; params'];
end