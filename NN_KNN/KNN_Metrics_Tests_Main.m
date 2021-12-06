%TODO


clear all;
close all;

%Use Full Image
[images, labels] = loadTrainingDataset(100);

%Use HOG
%[images, labels] = loadTrainingDatasetHOG();



[TP3, FP3, TN3, FN3, TP5, FP5, TN5, FN5, TP10, FP10, TN10, FN10] = testMetricsKNN(images, labels);
[recall3, precision3, specificity3, f_measure3, false_alarm_rate3] = Evalution_Metrics(TP3, FP3, TN3, FN3);
%testHOGMetricsKNN(500, images, labels);
%testHOGMetricsKNN(1000, images, labels);
%testHOGMetricsKNN(1500, images, labels);

