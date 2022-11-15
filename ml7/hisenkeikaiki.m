load census

%人口の推移をプロットした
figure, plot(cdate, pop, 'ro');
xlabel('census year');
ylabel('population');

%2次式による回帰と決定係数の表示
hold on;
[f, out] = fit(cdate, pop, 'poly2')
disp(out.rsquare);
plot(f, 'b-');

%7次式による回帰と決定係数の表示
[f, out] = fit(cdate, pop, 'poly7')
disp(out.rsquare);
plot(f, 'r-');

%ae^bxによる回帰と決定係数の表示
[f, out] = fit(cdate, pop, 'exp1')
disp(out.rsquare);
plot(f, 'g-');
hold off
