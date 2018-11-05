paths = ["./CEO/", "./PSO/", "./DE/"];
colors = ["b", "r", "k"];
[m, n]= size(paths);
generation_num = 101 %though sometimes its 100 only

bests = zeros(10,n,1);
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
    bests(:,i) = best(1:10);
    plot(X, max(1:100), colors(i)+ '--');
    plot(X, med(1:100), colors(i));
    plot(X, min(1:100), colors(i) + '-.');
    
end
%zooming on y axis to make it more interpretable
axis([1 100 2.8*10e-6 10e-5]);
hold off;

title('The anatomically detailed CA1 pyramid cell model');

legend('CEO max', ' CEO median', 'CEO minimum'...
    ,'PSO max', ' PSO median', 'PSO minimum'...
    ,'DE max', ' DE median', 'DE minimum');

%% Mann-Whitney U-test
indices = 1:1:n;
mw_p_values = zeros(n, 1);
k = 2 %MW test is for 2 sets of samples

combinations = nchoosek(indices,k);

for i = 1:n
    %TODO why are every p value equal?
    mw_p_values(i) = ranksum(bests(:,combinations(i,1)),...
                            bests(:,combinations(i,2)));
end

%% Kruskal Wallis test

kw_p_value = kruskalwallis(bests, ["CEO", "PSO", "DE"]);