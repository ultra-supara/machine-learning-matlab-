% exams:5教科の結果の書き込み
exams = readtable('Exams.xlsx', 'VariableNamingRule', 'preserve');

%label:科目名の取得
label = exams.Properties.VariableNames(2:end);

%tableから配列に変換する
data = table2array(exams(:,2:end));

%1つの共通因子による因子分析
[Lambda, Psi,T, stats, F] = factoran(data, 1);
%因子負荷量の表示
disp(Lambda);
%独自因子の分散の表示
disp(Psi);

%2つの共通因子による因子分析
[Lambda, Psi,T, stats, F] = factoran(data, 2, 'rotate', 'varimax');
%因子負荷量の表示
disp(Lambda);
%独自因子の分散の表示
disp(Psi);

%因子スコアの表示
biplot(Lambda, 'Varlabels', label, 'Score', F);
xlabel('Latent factor 1');
xlabel('Latent factor 2');

