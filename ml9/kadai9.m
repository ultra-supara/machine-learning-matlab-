load fisheriris
rng('default')

inds = ~strcmp(species, 'setosa');
X = meas(inds, 1:2);
y = species(inds);

n = length(y);
hpartition   = cvpartition(n, 'Holdout', 0.3);

idxTrain     = training(hpartition);
measTrain    = X(idxTrain,:);
speciesTrain = y(idxTrain);
idxTest      = test(hpartition);
measTest     = X(idxTest,:);
speciesTest  = y(idxTest);

SVMModel = fitcsvm(measTrain, speciesTrain);
predictedSpecies = predict(SVMModel, measTest);
figure, confusionchart(speciesTest, predictedSpecies);

treeModel = fitctree(measTrain, speciesTrain);
predictedSpecies = predict(treeModel, measTest);
figure, confusionchart(speciesTest, predictedSpecies);

KnnModel = fitctree(measTrain, speciesTrain);
predictedSpecies = predict(KnnModel, measTest);
figure, confusionchart(speciesTest, predictedSpecies);