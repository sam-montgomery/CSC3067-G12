%TODO
addpath .\SVM-KM
addpath ..\Full_Image\
addpath ..\HOG\
addpath ..\Evaluation_Metrics\

clear all;
close all;

%Use HOG
[trainingSet, testingSet] = loadFullImageDataset(500);

%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
[TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testingSet);
[recall, precision, specificity, f_measure, false_alarm_rate] = Evalution_Metrics(TP, FP, TN, FN);
