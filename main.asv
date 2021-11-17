%TODO
addpath .\SVM-KM\

clear all;
close all;


[images, labels] = loadTrainingDataset();

for i=1:size(images,1)/2
    trainingSet.images(i,:) = images(i,:);
    trainingSet.labels(i,:) = labels(i,:);
end

for i=1:size(images,1)/2
    index = size(images,1)/2 + i; 
    testSet.images(i,:) = images(index,:);
    testSet.labels(i,:) = labels(index,:);
end

modelAccuracyHH(trainingSet, testSet);