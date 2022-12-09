load humanactivity
rng('default')

n = length(Y);
hpartition = cvpartition(n, 'Holdout', 0.3);

idxTrain = training(hpartition);
featTrain = meas(idxTrain);
actidTrain = Y(idxTrain);

idxTest = test(hpartition);
featTest = meas(idxTest);
actidTest = Y(idxTest);

%マハラノビスの距離に基づく分類
predictedSpecies = classify(featTest, featTrain, actidTrain, 'mahalanobis');

confusionchart(actidTest, predictedSpecies) %混同行列の表示
