%TODO
addpath .\SVM-KM\

clear all;
close all;



[images, labels] = loadTrainingDataset();
%testDataset = loadTestDataset();
iteration = 20;

randOrder = randperm(size(images,1));
for i=1:iteration
    trainingSet.images(i,:) = images(randOrder(i),:);
    trainingSet.labels(i,:) = labels(randOrder(i),:);
end

for i=1:iteration
    index = size(images,1)/2 + i;
    index = int64(index) - 1;
    testSet.images(i,:) = images(randOrder(index),:);
    testSet.labels(i,:) = labels(randOrder(index),:);
end

%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
[accuracy, TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testSet, iteration);
recall = TP/(TP+FN);
precision = TP/(TP+FP);
specificity = TN/(TN+FP);
f_measure = (2*TN)/(2*TP+FN+FP);
false_alarm_rate = FP/(FP+TN);