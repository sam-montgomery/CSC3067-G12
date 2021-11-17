function accuracy = testMetrics(sampleSize)
    [images, labels] = loadTrainingDataset();
    
    for t=1:3
    randOrder = randperm(size(images,1));
        for i=1:sampleSize
            trainingSet.images(i,:) = images(randOrder(i),:);
            trainingSet.labels(i,:) = labels(randOrder(i),:);
        end
        
        for i=1:sampleSize
            index = size(images,1)/2 + i;
            index = int64(index) - 1;
            testSet.images(i,:) = images(randOrder(index),:);
            testSet.labels(i,:) = labels(randOrder(index),:);
        end
        
        accuracy(t) = modelAccuracyHHNN(trainingSet, testSet);
        disp(accuracy(t));
    end
end
