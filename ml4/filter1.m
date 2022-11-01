%1994年度のアメリカ国勢調査データセットの読み込み
load census1994
%年収が50000を超えるかどうか予測するためのデータ
head(adultdata)

%adultdata tableの数行を表示する
[idx, scores] = fscchi2(adultdata, 'salary');

idxInf = find(isinf(scores));
scores(idxInf) = max(scores(~isinf(scores)))

%グラフを表示する
figure, bar(scores(idx));
xlabel('rank');
ylabel('score');

%特殊文字の変換
xticklabels(strrep(adultdata.Properties.VariableNames(idx), '_', '\_'))


