function [TP, FP, TN, FN] = testHOGMetricsKNN(sampleSize, images, labels)

    %K = 3
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
        
        [TP(t), FP(t), TN(t), FN(t)] = modelAccuracyHHKNN(trainingSet, testSet, 3);
        %disp(accuracy(t));
        %disp(TP(t));
        %disp(FP(t));
        %disp(TN(t));
        %disp(FN(t));
    end

    %K = 5
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
        
        [TP(t), FP(t), TN(t), FN(t)] = modelAccuracyHHKNN(trainingSet, testSet, 5);
        %disp(accuracy(t));
        %disp(TP(t));
        %disp(FP(t));
        %disp(TN(t));
        %disp(FN(t));
    end

    %K = 10
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
        
        [TP(t), FP(t), TN(t), FN(t)] = modelAccuracyHHKNN(trainingSet, testSet, 10);
        %disp(accuracy(t));
        %disp(TP(t));
        %disp(FP(t));
        %disp(TN(t));
        %disp(FN(t));
    end
end
