function accuracy = testHOGMetricsKNN(sampleSize, images, labels)  
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
        
        accuracy(t) = modelAccuracyHHKNN(trainingSet, testSet, 3);
        disp(accuracy(t));
    end
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
        
        accuracy(t) = modelAccuracyHHKNN(trainingSet, testSet, 5);
        disp(accuracy(t));
    end
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
        
        accuracy(t) = modelAccuracyHHKNN(trainingSet, testSet, 10);
        disp(accuracy(t));
    end
end
