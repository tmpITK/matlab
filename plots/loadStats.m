function [max, min, med, bestParams] = loadStats(path)
%LOADSTATS Summary of this function goes here
%   Detailed explanation goes here
max = load(path + "max.txt");
med = load(path + "median.txt");
min = load(path + "min.txt");
bestParams = csvread(path + "last.csv", 1, 0, [1 0 10 0]);
end

