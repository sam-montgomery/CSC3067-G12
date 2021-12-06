function [trainingSet, testingSet] = loadFullImageDataset(samplesize)
    [images, labels] = loadTrainingDataset(samplesize);

    for i=1:2:size(images,1)
        trainingSet.images(i,:) = images(i,:);
        trainingSet.labels(i,:) = labels(i,:);
    end
    for i=2:2:size(images,1)
        testingSet.images(i,:) = images(i,:);
        testingSet.labels(i,:) = labels(i,:);
    end
end