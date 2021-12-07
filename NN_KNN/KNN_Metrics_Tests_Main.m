%TODO


clear all;
close all;

%change sample size
sampleSize = 1500;

[TP3, FP3, TN3, FN3, TP5, FP5, TN5, FN5, TP10, FP10, TN10, FN10] = testMetricsKNN(sampleSize);
[recall3, precision3, specificity3, f_measure3, false_alarm_rate3] = Evalution_Metrics(TP3, FP3, TN3, FN3);
[recall5, precision5, specificity5, f_measure5, false_alarm_rate5] = Evalution_Metrics(TP5, FP5, TN5, FN5);
[recall10, precision10, specificity10, f_measure10, false_alarm_rate10] = Evalution_Metrics(TP3, FP3, TN3, FN3);

%testHOGMetricsKNN(500, images, labels);
%testHOGMetricsKNN(1000, images, labels);
%testHOGMetricsKNN(1500, images, labels);
