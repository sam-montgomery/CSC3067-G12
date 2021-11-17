function accuracy = modelAccuracyHH_SVM(trainingDataset, testDataset)
    %For half and half accuracy, take half of the provided training dataset and pass
    %it in as trainingDataset, train the model based on this, and test it
    %with testDataset, which should be the other half of the original
    %training set 

    %train SVM Model
    model = SVMtraining(trainingDataset.images, trainingDataset.labels);
    tic;
    for i=1:size(testDataset.images, 1)
        im = testDataset.images(i,:);
        classificationResult(i,:) = testSVM(im, model);
    end
    toc;
    comparison = (testDataset.labels==classificationResult);
    accuracy = sum(comparison)/length(comparison);
end