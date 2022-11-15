load carbig.mat
rng('default');
X = [Weight Horsepower];
y = MPG; %MPG -> 目的変数

R = rmmissing([X y]); %欠損データの削除
X = R(:,1:2);
y = R(:,3);
Z = zscore(X); %標準化

%線形回帰モデルの生成
Mdl = fitrlinear(Z, y, 'KFold', 5)
%各分割の交差検証の損失
kfoldLoss(Mdl, 'mode', 'individual');

%線形回帰モデルの生成
Mdl = fitrkernel(Z, y, 'KFold', 5)
%各分割の交差検証の損失
kfoldLoss(Mdl, 'mode', 'individual');