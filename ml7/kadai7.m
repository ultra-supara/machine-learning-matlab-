load carbig.mat

rng('default');
X = [Acceleration Cylinders Weight Displacement Horsepower Model_Year];
y = MPG;

n = length(y);
hpartition = cvpartition(n, 'HoldOut', 0.3);
idxTrain = training(hpartition);
XTrain = X(idxTrain,:);
yTrain = y(idxTrain);
idxTest = test(hpartition);
XTtest = X(idxTest,:);
yTest = y(idxTest);

[B, Fitinfo] = lasso(XTrain, yTrain, 'Alpha', 0.01, 'CV', 10);
idxLambda1SE = FitInfo.Index1SE;
coef = B(:, idxLambda1SE)
coef0 = FitInfo.Intercept(idxLambda1SE);
yhat = XTtest * coef + coef0;
error = sum((yTest-yhat).^2, 'omitnan')

XTrain = [ones(size(yTrain)) XTrain];
XTtest = [ones(size(yTest)) XTtest];
b = regress(yTrain, XTrain);
yhat = XTtest * b;
error = sum((yTest-yhat).^2, 'omitnan')