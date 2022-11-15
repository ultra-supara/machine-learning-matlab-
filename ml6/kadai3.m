load carbig
rng('default');

%自動調整済み決定係数を用いた手動のSFG法による重回帰モデルの最適化
X = [Weight, Model_Year];
y = MPG;

%線形回帰モデルの生成
mdl = fitlm(X, y);

%可視化
scatter3(Weight, Model_Year, y, 'ro', 'filled')
hold on
x1fit = min(Weight):100:max(Weight);
x2fit = min(Horsepower):1:max(Horsepower);
[X1FIT X2FIT] = meshgrid(x1fit, x2fit);
YFIT = mdl.Coefficients.Estimate(1) + ...
       mdl.Coefficients.Estimate(2) * X1FIT + ...
       mdl.Coefficients.Estimate(3) * X2FIT;
mesh(X1FIT, X2FIT, YFIT)
xlabel('Weight');
ylabel('Model_Year');
zlabel('MPG');

view(50, 10)

%view(50, 10)
%hold off