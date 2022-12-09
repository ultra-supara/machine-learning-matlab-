[x, t] = iris_dataset;
rng('default')

%X = x(:,1:100);
%T = t(1:2, 1:100);

%net = perceptron;
%net = train(net, X, T);

%X = x(:,51:100);
%T = t(2:3, 51:150);

%net = perceptron;
%net = train(net, X, T);

net = patternnet(2); %ニューラルネットワークの準備
net.divideParam.trainRatio = 100/100; %訓練データの準備
net.divideParam.valRatio = 0/100; %検証データの準備
net.divideParam.testRatio = 0/100; %評価データの準備
net = train(net,X,T); %ニューラルネットワークの学習
