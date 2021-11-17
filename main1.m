%TODO
addpath .\SVM-KM\

clear all;
close all;



[images, labels] = loadTrainingDataset();
%testDataset = loadTestDataset();

randOrder = randperm(size(images,1));
for i=1:20
    trainingSet.images(i,:) = images(randOrder(i),:);
    trainingSet.labels(i,:) = labels(randOrder(i),:);
end

for i=1:20
    index = size(images,1)/2 + i;
    index = int64(index) - 1;
    testSet.images(i,:) = images(randOrder(index),:);
    testSet.labels(i,:) = labels(randOrder(index),:);
end

%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
modelAccuracyHH_SVM(trainingSet, testSet);

