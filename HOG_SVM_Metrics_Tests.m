%TODO
addpath .\SVM-KM\

clear all;
close all;

[images, labels] = loadTrainingDatasetHOG();

acc100 = testHOGMetricsSVM(100, images, labels);
acc500 = testHOGMetricsSVM(500, images, labels);
acc1000 = testHOGMetricsSVM(1000, images, labels);
acc1500 = testHOGMetricsSVM(1500, images, labels);

