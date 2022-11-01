load fisheriris.mat

rng('default');

X = randn(150, 5);
X(:, [1 3 5]) = meas(:,2:4);
y = meas(:,1);

%交差検証でLasso回帰
[B, FitInfo] = lasso(X, y, 'CV', 10);

lassoPlot(B, FitInfo, 'PlotType', 'CV');
B(:,66)

