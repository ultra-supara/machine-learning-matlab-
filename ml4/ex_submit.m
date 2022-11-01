load fisheriris.mat

rng('default');

X = randn(150, 5);
X(:, [1 3 5]) = meas(:,2:4);
y = meas(:,1);

t = templateTree('NumVariablesToSample', 'all',...
        'PredictorSelection', 'interaction-curvature',...
        'Surrogate', 'on');

Mdl = fitrensemble(X, MPG, 'Method', 'Bag', 'NumLearnCycles', 200, 'Learners', t);
impOOB = oobPermutedPredictorImportance(Mdl);

figure, bar(impOOB)
xlabel('Predictor Variable');
ylabel('Importance');
h = gca;
h.XTickLabel = Mdl.PredictorNames;

