function [trainingSet, testingSet] = loadLSDatasets(samplesize)
    [images, labels] = loadLSdataset(samplesize);
    index = 1;
    for i=1:2:samplesize
        trainingSet.images(index,:) = images(i,:);
        trainingSet.labels(index,:) = labels(i,:);
        index = index + 1;
    end
    index = 1;
    for i=2:2:samplesize
        testingSet.images(index,:) = images(i,:);
        testingSet.labels(index,:) = labels(i,:);
        index = index+1;
    end
end