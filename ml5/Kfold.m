
load fisheriris

rng('default');

n = length(species);
%評価データと学習データを半分にする
c = cvpartition(n, 'KFold', 2); %k分割交差検証用のデータ分割　今回は2分割
lda = fitcdiscr(meas, species, 'CVPartition', c); %3クラスを分類する凶器亜直線の決定
predictedSpecies = kfoldPredict(lda); %k分割交差検証による分類
confusionchart(species, predictedSpecies); %混同行列の表示

%上のコードと同じ結果になります
c = cvpartition(n, 'LeaveOut'); %leave one out用のデータの分割
lda = fitcdiscr(meas, species, 'CVPartition', c); %3クラスを分類する凶器亜直線の決定
predictedSpecies = kfoldPredict(lda); %k分割交差検証による分類
confusionchart(species, predictedSpecies); %混同行列の表示
