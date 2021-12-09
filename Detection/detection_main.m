clear all;
close all;

[trainingSet.images, trainingSet.labels] = loadFullTrainingDatasetHOG();

SVMModel = SVMtraining(trainingSet.images, trainingSet.labels);

testDataset = loadTestDataset();
image = testDataset.images(1,5);
scalingDetector(image, SVMModel);