load fisheriris

rng('default');

% k-means : クラスタリングのハイパーパラメタの設定 1 <= k <= 10
num = optimizableVariable('k', [1, 10], 'Type', 'integer');
% 距離の計算 'chebychev', 'euclidean', 'minkowski'
dst = optimizableVariable('dst', {'chebychev', 'euclidean', 'minkowski'}, ...
    'Type', 'categorical');

%k分割交差検証用のデータ分割
c = cvpartition(species, 'KFold', 5);

%k-meansを使ったloss計算関数の定義
fun = @(x)kfoldLoss(fitcknn(meas, species, 'CVPartition', c, ...
    'NumNeighbors', x.k, 'Distance', char(x.dst)));

%ベイズ最適化によるパイパーパラメタの更新
results = bayesopt(fun, [num, dst])

%最適なハイパーパラメタの組みあわせ表示
results.XAtMinObjective

