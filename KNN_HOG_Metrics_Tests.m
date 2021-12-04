%TODO
addpath .\SVM-KM\

clear all;
close all;

[images, labels] = loadTrainingDatasetHOG();

[TP, FP, TN, FN] = testHOGMetricsKNN(100, images, labels);
[recall, precision, specificity, f_measure, false_alarm_rate] = Evalution_Metrics(TP, FP, TN, FN);
%testHOGMetricsKNN(500, images, labels);
%testHOGMetricsKNN(1000, images, labels);
%testHOGMetricsKNN(1500, images, labels);

