%TODO
addpath .\SVM-KM
addpath ..\Full_Image\
addpath ..\HOG\

clear all;
close all;

sampleSize = 100;

%Use Full Image
[trainingSet, testingSet] = loadFullImageDataset(sampleSize);


%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
[TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testingSet);
recall = TP/(TP+FN);
precision = TP/(TP+FP);
specificity = TN/(TN+FP);
f_measure = (2*TN)/(2*TP+FN+FP);
false_alarm_rate = FP/(FP+TN);