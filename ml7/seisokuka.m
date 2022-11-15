load carbig.mat

%乱数生成からモデルの読み込みまで
rng('default');
X = [Acceleration Cylinders Weight Displacement Horsepower Model_Year];
y = MPG;

n = length(y);
hpartition = cvpartition(n, 'HoldOut', 0.3);
idxTrain = training(hpartition); %交差検証用のデータ分割
XTrain = X(idxTrain,:); %訓練用のインデックスの取得
yTrain = y(idxTrain); %特徴量の代入
idxTest = test(hpartition); %訓練用の教師データの代入
XTtest = X(idxTest,:); %評価用の特徴量の代入
yTest = y(idxTest); %評価用の正解データの代入

[B, FitInfo] = lasso (XTrain, yTrain, 'Alpha', 0.01, 'CV', 10);
idxLambda1SE = FitInfo.Index1SE; %MSE最小のラムダを取得
coe = B(:, idxLambda1SE) %最小のラムダの時の係数
coef0 = FitInfo.Intercept(idxLambda1SE) %最小ラムダの時の切片

yhat = XTtest * coe + coef0;
hold on
scatter(yTest, yhat);
plot(yTest, yTest)
xlabel('Actual MPG');
ylabel('Predicted MPG');
hold off