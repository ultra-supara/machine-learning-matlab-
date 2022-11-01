%データの読み込み
load fisheriris
figure, gscatter(meas(:,1), meas(:,2), species, 'rgb', 'osd');
xlabel('Sepal length');
ylabel('Sepal width');

%ニューラルネットワークによる分類
rng("default");
Mdl = fitcnet(meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, meas(:,1:2), species, "LossFun", "classiferror")

%0-1
norm_meas = normalize(meas, 1, 'range', [0 1]);
Mdl = fitcnet(meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, meas(:,1:2), species, "LossFun", "classiferror")

%-1-1
norm_meas = normalize(meas, 1, 'range', [-1 1]);
Mdl = fitcnet(meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, meas(:,1:2), species, "LossFun", "classiferror")

%z-score
norm_meas = normalize(meas, 1, 'zscore');
Mdl = fitcnet(meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, meas(:,1:2), species, "LossFun", "classiferror");