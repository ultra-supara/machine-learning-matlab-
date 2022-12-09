load fisheriris
rng(1)

n = length(species);
hprtition = cvpartition(n, 'HoldOut', 0.3);

idxTrain = training(hprtition);
measTrain = meas(idxTrain,:);
speciesTrain = species(idxTrain);

idxTest = test(hprtition);
measTest = meas(idxTest,:);
speciesTest = species(idxTest);

%3つのクラスを分類するKNN(５分割交差検証によるDistance, NumNeighborsの最適化)
Mdl = fitcknn(measTrain, speciesTrain, 'OptimizeHyperparameters', 'auto',...
    'HyperparameterOptimizationOptions',...
    struct('AcquisitionFunctionName', 'expected-improvement-plus', 'ShowPlots', true, 'Verbose', 0, 'Kfold', 5, 'MaxObjectiveEvaluations', 20, 'UseParallel', true))

predictedSpecies = predict(Mdl, measTest);
confusionchart(speciesTest, predictedSpecies)
