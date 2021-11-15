function dEuc = EuclideanDistance(sample1, sample2)
sumTotal = 0;
for i=1:length(sample1)
    sumTotal = sumTotal + (sample1(i) - sample2(i))^2;
end

dEuc = sqrt(sumTotal);
end
