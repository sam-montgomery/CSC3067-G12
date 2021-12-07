%TODO
addpath .\SVM-KM
addpath ..\Full_Image\
addpath ..\HOG\
addpath ..\Evaluation_Metrics\
addpath ..\Edge_Extraction\

clear all;
close all;

sampleSize = 300;

%Use Full Image
[trainingSet, testingSet] = loadHOGDataset(sampleSize);

%Use Full Image
%[trainingSet, testingSet] = loadEEDataset(sampleSize);

%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
[TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testingSet);
[recall, precision, specificity, f_measure, false_alarm_rate] = Evalution_Metrics(TP, FP, TN, FN);
