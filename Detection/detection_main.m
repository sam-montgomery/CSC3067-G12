clear all;
close all;

[trainingSet.images, trainingSet.labels] = loadTrainingDatasetHOG(1900);

SVMModel = SVMtraining(trainingSet.images, trainingSet.labels);

%modelNN = trainNN(trainingImages, trainingLabels);

testDataset = loadTestDataset();
image = testDataset.images(1,1);
scalingDetector(image, SVMModel);