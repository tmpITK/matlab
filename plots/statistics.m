
cla;


X = 3:1:100;
hold on;
grid on;

paths = ["./CEO/", "./PSO/"];
colors = ["b", "r", "k"];
[m, n]= size(paths);

bests = zeros(n, 10, 1);

legend;
for i=1:2
    [max, med, min, best] = loadStats(paths(i));

    bests(i, 1:10) = best(1:10);
    plot(X, max(3:100), colors(i)+ '--');
    plot(X, med(3:100), colors(i));
    plot(X, min(3:100), colors(i) + '-.');
end

bests(1,1:10)
title('The anatomically detailed CA1 pyramid cell model');

legend('CEO max', ' CEO median', 'CEO minimum'...
    ,'PSO max', ' PSO median', 'PSO minimum' );

%%
%Mann-Whitney U-test

p = ranksum(bests(1, 1:10), bests(2,1:10));
%p = 1.826717911095504e-04 which means the difference in medians is
%significant