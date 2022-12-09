load fisheriris.mat
rng(1)

inds = ~strcmp(species,'setosa');
X = meas(inds,3:4);
y = species(inds);

n = length(y);
hpartition = cvpartition(n,'Holdout',0.3);

idxTrain = training(hpartition);
measTrain = X(idxTrain,:);
speciesTrain = y(idxTrain);

idxTest = test(hpartition);
measTest = X(idxTest,:);
speciesTest = y(idxTest);

%2つのクラスを分類するSVM
SVMModel = fitcsvm(measTrain,speciesTrain,'KernelFunction','linear','Standardize',true);
predictedSpecies = predict(SVMModel,measTest);
confusionchart(speciesTest,predictedSpecies);
