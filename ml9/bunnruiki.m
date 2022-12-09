load fisheriris
rng('default')

n  = length(species)  %サンプル数の取得
hpartition = cvpartition(n, 'HoldOut', 0.3); %交差検証用のデータの分割

idxTrain = training(hpartition);
measTrain = meas(idxTrain,:);
speciesTrain = species(idxTrain);

idxTest = training(hpartition);         %評価用インデックスの取得
measTest = meas(idxTest, :);          %評価用特徴量の代入
speciesTest = Y(idxTest);             %評価用教師データの代入

%3つのクラスを分類する分類木の決定(ジニ係数: gdi, エントロピー: deviance)
ctree = ftctree(measTrain, speciesTrain, 'SplitCriterion', 'gdi', ...
    'OptimizeHyperparameters', 'auto'); %分類木の最適化
view(ctree, 'Mode', 'graph'); %分類木の可視化

predictedSpecies = predict(ctree, measTest); %評価データに対する分類
confusionchart(speciesTest, predictedSpecies); %混同行列の表示
