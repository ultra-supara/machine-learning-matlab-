% 自動車セットの読み込み
load carbig

%categorical変数に変換
Cylinders = categorical(Cylinders);
Model_Year = categorical(Model_Year);
Origin = categorical(cellstr(Origin));

%table変数に変換
X = table(Cylinders, Displacement, Horsepower, Weight, Acceleration, Model_Year, Origin);

%回帰木(決定木の回帰版)
t = templateTree('NumVariablesToSample', 'all',...　%全ての特徴量を調査する
        'PredictorSelection', 'interaction-curvature',...　%交互作用の調査
        'Surrogate', 'on'); %欠損値に対応
rng('default'); %再現のためのシード

%200回の回帰木モデルを生成する
Mdl = fitrensemble(X, MPG, 'Method', 'Bag', 'NumLearnCycles', 200, 'Learners', t);
impOOB = oobPermutedPredictorImportance(Mdl);

%特徴量の重要度推定
figure, bar(impOOB)
xlabel('Predictor Variable');
ylabel('Importance');
h = gca;
h.XTickLabel = Mdl.PredictorNames;