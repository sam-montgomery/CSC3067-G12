function [modelSVM] = trainSVM_ForAccuracy(trainingSet, testSet)
    %add path for SVM Toolbox
    addpath .\SVM-KM\
    
    images= [trainingSet.images];
    labels= [trainingSet.labels];
    
    modelSVM = SVMtraining(images, labels);
end