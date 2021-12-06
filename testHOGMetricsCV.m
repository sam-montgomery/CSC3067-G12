function accuracy = testHOGMetricsCV(sampleSize, kFolds, images, labels)
    randI = randperm(size(images,1));
    trainingSet.images = [];
    trainingSet.labels = [];
    testSet.images = [];
    testSet.labels = [];

    %Fill samplesize w/ random images and labels
    for i=1:sampleSize
        kMat.images(i,:) = images(randI(i), :);
        kMat.labels(i,:) = labels(randI(i), :);
    end
    kGroupSize = sampleSize / kFolds;
    %For each group/fold (k)
    for i=1:kFolds
        %Assign 1 test group
        for j=1:kGroupSize
            testSet.images((j),:) = kMat.images((j),:);
            testSet.labels((j),:) = kMat.labels((j),:);
        end
        %Assign remaining images to training set
        for j=1:i-1
            for k=1:kGroupSize
                trainingSet.images((k*j),:) = kMat.images((k*j),:);
                trainingSet.labels((k*j),:) = kMat.labels((k*j),:);
            end
        end
        for j=(i+1):kFolds
            currentSize = size(trainingSet.images, 1);
            for k=1:kGroupSize
                trainingSet.images((currentSize + k ),:) = kMat.images((currentSize + k ),:);
                trainingSet.labels((currentSize + k ),:) = kMat.labels((currentSize + k ),:);
            end
        end

        %Train model based on training groups and test with test group  
        accuracy(i) = modelAccuracyNN(trainingSet, testSet);
        disp(accuracy(i));


        trainingSet.images = [];
        trainingSet.labels = [];
        testSet.images = [];
        testSet.labels = [];
        
    end

    for t=1:3
        randOrder = randperm(size(images,1));
        for i=1:noOfTrainingIm
            trainingSet.images(i,:) = images(randOrder(i),:);
            trainingSet.labels(i,:) = labels(randOrder(i),:);
        end
        
        for i=1:noOfTestingIm
            index = noOfTrainingIm + i;
            testSet.images(i,:) = images(randOrder(index),:);
            testSet.labels(i,:) = labels(randOrder(index),:);
        end
    end
end
