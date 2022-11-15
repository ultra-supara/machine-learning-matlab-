load carsmall

%Weight:車重、 Horsepower:馬力、MPG:燃費
rng('default');
%回帰木のモデルの作成
tree = fitrtree([Weight, Horsepower], MPG, ...
    'OptimizeHyperParameters', 'auto',...
    'HyperParameterOptimizaionoptions',...
    struct('AcquisitionFunctionName', 'expected-improvement-plus'), ...
    'PredictorNames', {'W', 'H'})

%可視化
view(tree, 'Mode', 'graph');

%予測
pred_MPG = predict(tree, [3000 100; 4000 150; 4000 200])
