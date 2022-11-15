load carsmall

%Weight:車重、 Horsepower:馬力、MPG:燃費

%回帰木のモデルの作成
tree = fitrtree([Weight, Horsepower], MPG, ...
    'PredictorNames', {'W', 'H'})

%可視化
view(tree, 'Mode', 'graph');

%予測
pred_MPG = predict(tree, [3000 100; 4000 150; 4000 200])
