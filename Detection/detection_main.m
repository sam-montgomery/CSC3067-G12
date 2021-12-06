clear all;
close all;

[images, labels] = loadTrainingDatasetHOG(2000);

testDataset = loadTestDataset();

SVMModel = SVMtraining(images, labels);
%modelNN = trainNN(trainingImages, trainingLabels);
image = testDataset.images(1,10);
detect(image, SVMModel);