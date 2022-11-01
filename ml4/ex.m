load fisheriris.mat

figure, histogram(meas(:,3));
figure, histogram(meas(:,4));

X(:,1) = log(meas(:,3));
X(:,1) = log(meas(:,4));

figure, histogram(X(:,1));
figure, histogram(X(:,2));

rng("default")

Mdl = fitcnet(meas(:,3:4), species, "IterationLimit", 10);
testError = loss(Mdl, meas(:,3:4), species, "LossFun", "classiferror")

Mdl = fitcnet(X(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, X(:,1:2), species, "LossFun", "classiferror")

