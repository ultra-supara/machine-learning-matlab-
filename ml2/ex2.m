%データのラングリングとしての欠損値処理

%適当なデータの作成
x = 1:30;
y = 2 * x + 5 +15*(rand(size(x)));
figure, plot(x, y, 'bo');
title('original data');

%欠損値の作成
y(5:5:25) = NaN;

%欠損値の代入は単一代入法で！
mean_y = mean(y(:), 'omitnan');

%単一代入法
[F, TF] = fillmissing(y, 'constant', mean_y, 'samplePoints', x);
figure, plot(x, y, 'bo', x(TF), F(TF), 'rx');
title('assign mean data');

%回帰代入法
[F, TF] = fillmissing(y, 'linear', 'samplePoints', x);
figure, plot(x, y, 'bo', x(TF), F(TF), 'rx');
title('assign linear data');

%K-NN法 , nearest-neighbor
[F, TF] = fillmissing(y, 'nearest', 'samplePoints', x);
figure, plot(x, y, 'bo', x(TF), F(TF), 'rx');
title('assign nearest data');