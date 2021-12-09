clear all;
close all;

testDataset = loadTestDataset();
index = 1;
for i=1:100
    im = testDataset.images(1,i);
    im = cell2mat(im);
    detection = cell2mat(testDataset.BBs(i));
    for j=1:testDataset.noOfPedestrians(i,1)
        window = double(imcrop(im, detection(j,:)));
        window = imresize(window, [160, 96]);
        windowHog = hog_feature_vector(window);
        testset.images(index,:) = windowHog;
        testset.labels(index,:) = 1;
        index = index + 1;
    end
end

[trainingSet.images, trainingSet.labels] = loadFullTrainingDatasetHOG();
SVMModel = SVMtraining(trainingSet.images, trainingSet.labels);
[TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingSet, testset);