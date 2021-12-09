%TODO
addpath .\SVM-KM
addpath ..\Full_Image\
addpath ..\HOG\
addpath ..\Evaluation_Metrics\
addpath ..\Edge_Extraction\
addpath ..\'Image Pre-Processing'\

clear all;
close all;

%Use HOG
%[trainingSet, testingSet] = loadHOGDataset(300);
sampleSize = 1500;

%Use Full Image
%[trainingSet, testingSet] = loadHOGDataset(sampleSize);

%Use Edge Extraction
%[trainingSet, testingSet] = loadEEDataset(sampleSize);

%Use Pre=Processing
[trainingSet, testingSet] = loadLSDatasets(sampleSize);

%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
[TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testingSet);
[recall, precision, specificity, f_measure, false_alarm_rate] = Evalution_Metrics(TP, FP, TN, FN);
