%あやめデータの読み込み
load fisheriris
%主成分分析
[coeff, score, latent] = pca(data);

%第1主成分、第2主成分の係数
coeff(:,1)
coeff(:,2)

%累積寄与率の表示
CR = cumsum(latent)/sum(latent)

%教師あり学習
lda = fitcdiscr(score(:,1:2), species); %3クラスを分類する境界直線の決定
ldaclass = resubPredict(lda); %境界直線に基づいて分類した結果の取得
figure, gscatter(meas(:,1), meas(:,2), ldaClass,'rgb', 'osd');

