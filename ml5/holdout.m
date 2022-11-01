%あやめデータの読み込み
load fisheriris
%乱数生成
rng('default');

%サンプル数の取得
n = length(species);
%交差検証用のデータの分割
hpartition = cvpartition(n, 'HoldOut', 0.3);

%訓練用のインデックスの取得、特徴量の代入、教師データの代入
idxTrain = training(hpartition);
measTrain = meas(idxTrain, :);
speciesTrain = species(idxTrain);

%評価用のインデックスの取得、特徴量の代入、教師データの代入
idxTest = test(hpartition);
measTest = meas(idxTrain, :);
speciesTest = species(idxTrain);

%3クラスを分類する境界直線の決定
lda = fitcdiscr(measTrain, speciesTrain);
%評価データに対する分類
predictedSpecies = predict(lda, measTest);

%混同行列の表示
confusionchart(speciesTest, predictedSpecies);
