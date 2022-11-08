load carsmall.mat

X = [Weight, Housepower];
y = MPG;

mdl = fitlm(X, y)

scatter3(Weight, Horsepower, y, 'ro', 'filled')
hold on 
x1fit = min(Weight):100:max(Weight);
x2fit = min(Horsepower):10:max(Horsepower);
[X1FIT X2FIT] = meshgrid(x1fit, x2fit);
YFIT = mdl.Coefficients.Estimate(1) + ...
       mdl.Coefficients.Estimate(2) * X1FIT + ...
       mdl.Coefficients.Estimate(3) * X2FIT;
mesh(X1FIT, X2FIT, YFIT)
xlabel('Weight');
ylabel('Horsepower');
zlabel('MPG');

view(50, 10)
hold off
