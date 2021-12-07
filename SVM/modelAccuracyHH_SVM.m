function [TP, FP, TN, FN] = modelAccuracyHH_SVM(trainingDataset, testDataset)
    %For half and half accuracy, take half of the provided training dataset and pass
    %it in as trainingDataset, train the model based on this, and test it
    %with testDataset, which should be the other half of the original
    %training set 

    %train SVM Model
    tic;
    model = SVMtraining(trainingDataset.images, trainingDataset.labels);
    toc;

    tic;
    for i=1:size(testDataset.images, 1)
        im = testDataset.images(i,:);
        classificationResult(i,:) = testSVM(im, model);
    end
    toc;

    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;

    for i =1:size(classificationResult)
        if(testDataset.labels(i) == 1 && classificationResult(i) == 1)
            TP = TP + 1;
        end
        if(testDataset.labels(i) == -1 && classificationResult(i) == 1)
            FP = FP + 1;
        end
        if(testDataset.labels(i) == -1 && classificationResult(i) == -1)
            TN = TN + 1;
        end
        if(testDataset.labels(i) == 1 && classificationResult(i) == -1)
            FN = FN + 1;
        end
    end
    
    %comparison = (testDataset.labels==classificationResult);
end