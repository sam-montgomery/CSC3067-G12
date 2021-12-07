clear all;
close all;

[trainingSet.images, trainingSet.labels] = loadENHEDataset(500);

for i=1:size(trainingSet.images, 1)
    trainingSet.images(i,:) = enhanceContrastHE(trainingSet.images(i,:));
end

SVMModel = SVMtraining(trainingSet.images, trainingSet.labels);

% modelNN = trainNN(trainingSet.images, trainingSet.labels);

testDataset = loadTestDataset();
image = testDataset.images(1,10);
scalingDetector(image, SVMModel);