%あやめデータの読み込み
load fisheriris
%meas(:, 1-4) : がく片の長さと幅、花弁の長さと幅に関する測定値
X = meas(:, 1:4);

%教師ありのプロット、正解のデータに基づいてがく片の長さと幅をプロットする
figure, gscatter(X(:, 1), X(:, 2), species, 'rgb', 'osd');
%正解のデータに基づいて花弁の長さと幅をプロットする
figure, gscatter(X(:, 3), X(:, 4), species, 'rgb', 'osd');

%教師あり学習(判別分析) 3クラスを分類する境界直線の決定
lda = fitcdiscr(X, species);
%境界直線に基づいて分類した結果の取得
ldaClass = resubPredict(lda);

%予測データに基づいたがく片の長さと幅をプロットする
figure, gscatter(X(:,1), X(:,2), ldaClass, 'rgb', 'osd');
%予測データに基づいて花弁の長さと幅をプロットする
figure, gscatter(X(:,3), X(:,4), ldaClass, 'rgb', 'osd');
