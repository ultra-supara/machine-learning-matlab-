%fruits:5つの果物の好き嫌いの結果の読み込み
fruits = readtable('Fruits.xlsx', 'VariableNamingRule', 'preserve');

%フルーツ名の取得
label = fruits.Properties.VariableNames(2:end);

%テーブルから配列に変換
data = table2array(fruits(:,2:end));

%主成分分析
[coeff, score, latent] = pca(data);

%第1主成分 , 第2主成分の係数
coeff(:,1)
coeff(:,2)

%累積寄与率の表示
CR = cumsum(latent)/sum(latent)

%主成分スコアの表示
biplot(coeff(:,1:2), 'Scores',score(:,1:2), 'VarLabels', label);
title('Predicted Component Score');
xlabel('1st Principal Component');
ylabel('2nd Principal Component');