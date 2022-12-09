% アヤメデータの読み込み
% meas(:,1～4)：がく片の長さと幅、花弁の長さと幅に関する測定値
% species：アヤメの種(setosa, versicolor, virginica)
load fisheriris
rng('default');                         %For reproducibility

Y = strcmp(species, 'setosa');          %setosaとそれ以外で教師データを作成

n = length(Y);                          %サンプル数の取得
hpartition = cvpartition(n, 'HoldOut', 0.3);  %交差検証用のデータの分割

idxTrain = training(hpartition);        %訓練用インデックスの取得
measTrain = meas(idxTrain, :);          %訓練用特徴量の代入
speciesTrain = Y(idxTrain);             %訓練用教師データの代入

idxTest = training(hpartition);         %評価用インデックスの取得
measTest = meas(idxTest, :);            %評価用特徴量の代入
speciesTest = Y(idxTest);               %評価用教師データの代入

Mdl = fitclinear(measTrain, speciesTrain, 'Learner', 'logistic');
disp(Mdl.Beta)                          %回帰係数の表示
predictedSpecies = predict(Mdl, measTest);          %評価データに対する分類

confusionchart(speciesTest, predictedSpecies)       %混同行列の表示
