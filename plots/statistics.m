paths = ["./CEO/", "./PSO/", "./DE/"];
colors = ["b", "r", "k"];
[m, n]= size(paths);
generation_num = 101 %though sometimes its 100 only

bests = zeros(n, 10, 1);
X = 1:1:100;

cla;

hold on;
grid on;
legend;
for i=1:n
    [max, med, min, best] = loadStats(paths(i));
    [generations,k]=size(max);
    if generations>generation_num
        rate = ceil(generations/generation_num)
        max = downsample(max, rate);
        med = downsample(med, rate);
        min = downsample(min, rate);
    end
    
    bests(i, 1:10) = best(1:10);
    plot(X, max(1:100), colors(i)+ '--');
    plot(X, med(1:100), colors(i));
    plot(X, min(1:100), colors(i) + '-.');
    
end
%zooming on y axis to make it more interpretable
axis([1 100 2.8*10e-6 10e-5]);
hold off;
bests(1,1:10)
title('The anatomically detailed CA1 pyramid cell model');

legend('CEO max', ' CEO median', 'CEO minimum'...
    ,'PSO max', ' PSO median', 'PSO minimum'...
    ,'DE max', ' DE median', 'DE minimum');

%%
%Mann-Whitney U-test

p = ranksum(bests(1, 1:10), bests(2,1:10));
%p = 1.826717911095504e-04 which means the difference in medians is
%significant