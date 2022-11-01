%あやめデータの読み込み
load fisheriris

rng('default');

%乱数で特徴量を生成
X = randn(150, 10);
%不要な特徴量を持つデータセットの作成
X(:, [1 3 5 7]) = meas;
%教師データのコピー
y = species;

%交差検証用にデータをk=10個に分割する
c = cvpartition(y, 'k', 10);

%Sequence Forward Generation法の精度の定義 , fitcecoc:マルチクラス分類関数, loss:分類誤差
fun = @(XT, yT, Xt, yt)(loss(fitcecoc(XT, yT), Xt, yt));

%Sequence Forward Generation法による特徴選択
opts = statset('Display', 'iter');
%反復による結果の表示option
[fs, history] = sequentialfs(fun, X, y, 'cv', c, 'options', opts)

disp(history.In)

