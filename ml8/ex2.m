% アヤメデータの読み込み
% meas(:,1～4)：がく片の長さと幅、花弁の長さと幅に関する測定値
% species：アヤメの種(setosa, versicolor, virginica)
load fisheriris
rng('default');                             %For reproducibility

gscatter(meas(:,3), meas(:,4), species);    %花弁の長さと幅のプロット
hold on                                     %グラフに追加

X = [meas(:,3) meas(:,4)];
MdlLinear = fitcdiscr(X, species);          %線形判別関数の生成

MdlLinear.ClassNames([2 3])
K = MdlLinear.Coeffs(2, 3).Const;
L = MdlLinear.Coeffs(2, 3).Linear;
f = @(x1, x2) K+L(1)*x1+L(2)*x2;
fimplicit(f, [0 8 0 3]);

MdlLinear.ClassNames([1 2])
K = MdlLinear.Coeffs(1, 2).Const;
L = MdlLinear.Coeffs(1, 2).Linear;
f = @(x1, x2) K+L(1)*x1+L(2)*x2;
fimplicit(f, [0 8 0 3]);
hold off;
