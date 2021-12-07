%TODO
addpath .\SVM-KM
addpath ..\Full_Image\
addpath ..\HOG\
addpath ..\Evaluation_Metrics\
addpath ..\Edge_Extraction\

clear all;
close all;

<<<<<<< HEAD
%Use HOG
[trainingSet, testingSet] = loadHOGDataset(300);
=======
sampleSize = 300;

%Use Full Image
[trainingSet, testingSet] = loadHOGDataset(sampleSize);

%Use Full Image
%[trainingSet, testingSet] = loadEEDataset(sampleSize);
>>>>>>> 4ae29303eb813b767e658bda1d80fc19720ec287

%SVMModel = trainSVM(trainingSet.images, trainingSet.labels);
[TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testingSet);
[recall, precision, specificity, f_measure, false_alarm_rate] = Evalution_Metrics(TP, FP, TN, FN);
