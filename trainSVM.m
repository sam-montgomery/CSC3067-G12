function [modelSVM] = trainSVM(images, labels)
    %add path for SVM Toolbox
    addpath .\SVM-KM\
    
    %load taining dataset
    %[images, labels] = loadTrainingDataset();
    
    
    %indexesNeg = find (labels == -1);
    %indexesPos = find (labels == 1);
    
    %images= [images(indexesNeg,:); images(indexesPos,:)];
    %labels= [labels(indexesNeg); labels(indexesPos)];
    
    modelSVM = SVMtraining(images, labels);
end