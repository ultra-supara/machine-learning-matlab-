load fisheriris
rng('default')

tbl = table(meas(:,1), meas(:,2), meas(:,3), meas(:,4),species)

hpartition = cvpartition(length(tbl.species), "Holdout", 0.25);
idxLearn = training(hpartition);
tblLearn = tbl(idxLearn,:);
idxValid = test(hpartition);
tblValid = tbl(idxValid,:);

Mdl = fitcnet(tblLearn, "species");
iteration1 = Mdl.TrainingHistory.Iteration;
trainLosses1 = Mdl.TrainingHistory.TrainingLoss;

Mdl = fitcnet(tblLearn, "species", "ValidationData",tblValid);
iteration2 = Mdl.TrainingHistory.Iteration;
trainLosses2 = Mdl.TrainingHistory.TrainingLoss;
valLosses = Mdl.TrainingHistory.ValidationLoss;

plot(iteration1, trainLosses1, iteration2, trainLosses2, iteration2, valLosses)
legend(["Training 1", "Training2", "Validation"])
xlabel("Iteration")
ylabel("Cross-Entropy Loss")
