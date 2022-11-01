%あやめデータの読み込み
load fisheriris
%meas(:, 1-4) : がく片の長さと幅、花弁の長さと幅に関する測定値
X = meas(:, 1:2);

% species : あやめの種(setosa, versicolor, virginica)
figure, gscatter(X(:,1), X(:,2), species, 'rgb', 'osd');
xlabel('length');
ylabel('width');

%教師ありのプロット
lda = fitcdiscr(X, species);
ldaClass = resubPredict(lda);

%教師あり学習
figure, gscatter(X(:,1), X(:,2), ldaClass, 'rgb', 'osd');

