clear all;
close all;

% [images, labels] = loadTrainingDatasetHOG(1500);

[trainingSet, testingSet] = loadFullImageDataset(20);

testDataset = loadTestDataset();

SVMModel = SVMtraining(images, labels);

testHOGMetricsSVM(1500, images, labels);
%modelNN = trainNN(trainingImages, trainingLabels);
image = testDataset.images(1,1);
detect(image, SVMModel);