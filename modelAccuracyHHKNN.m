function [TP, FP, TN, FN] = modelAccuracyHHKNN(trainingDataset, testDataset, k)
    %For half and half accuracy, take half of the provided training dataset and pass
    %it in as trainingDataset, train the model based on this, and test it
    %with testDataset, which should be the other half of the original
    %training set 

    model = trainNN(trainingDataset.images, trainingDataset.labels);
    tic;
    for i=1:size(testDataset.images, 1)
        im = testDataset.images(i,:);
        classificationResult(i,:) = testKNN(im, model, k);
    end
    toc;

    TP = 0;
    FP = 0;
    TN = 0;
    FN = 0;

    for i =1:length(classificationResult)
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
    %accuracy = sum(comparison)/length(comparison);
end
