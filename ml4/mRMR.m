%1994年度のアメリカ国勢調査データセットの読み込み
load census1994
%年収が50000を超えるかどうか予測するためのデータ
head(adultdata)

%変更箇所
[idx, scores] = fscmrmr(adultdata, 'salary');

%グラフを表示する
figure, bar(scores(idx));
xlabel('rank');
ylabel('score');

%特殊文字の変換
xticklabels(strrep(adultdata.Properties.VariableNames(idx), '_', '\_'))