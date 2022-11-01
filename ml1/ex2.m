%あやめデータの読み込み
load fisheriris
%meas(:, 1-4) : がく片の長さと幅、花弁の長さと幅に関する測定値
X = meas(:, 1:2);

%教師あり
figure, gscatter(X(:, 1), X(:, 2), species, 'rgb', 'osd');
xlabel('length');
ylabel('width');

%教師なし
figure, plot(X(:, 1), X(:, 2), 'k*', 'MarkerSize', 5);
xlabel('length');
ylabel('width');

%教師なし学習(k-means)学習によるクラスタリング、idx:予測クラスター、C:k個のクラスタリングの重心
[idx, C] = kmeans(X, 3);
figure;

plot(X(idx==1,1), X(idx==1,2), 'b.', 'MarkerSize', 12);
hold on
plot(X(idx==2,1), X(idx==2,2), 'g.', 'MarkerSize', 12);
plot(X(idx==3,1), X(idx==3,2), 'r.', 'MarkerSize', 12);

%3つのクラスを分類する境界直線の決定
plot(C(:,1), C(:,2), 'kx', 'MakerSize', 15, 'LineWidth', 3);
%境界直線に基づいて分類した結果の取得
legend('C_1','C_2', 'C_3', 'Centroids', 'Location', 'NW');
hold off