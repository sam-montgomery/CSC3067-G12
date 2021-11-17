%TODO
addpath .\SVM-KM\

clear all;
close all;

[images, labels] = loadTrainingDatasetHOG();

testHOGMetrics(100, images, labels);
testHOGMetrics(500, images, labels);
testHOGMetrics(1000, images, labels);
testHOGMetrics(1500, images, labels);