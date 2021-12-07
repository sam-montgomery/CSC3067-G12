function accuracy = testHOGMetricsSVM(sampleSize, images, labels)  
    for t=1:3
        index = 1;
        for i=1:2:sampleSize
            trainingSet.images(index,:) = images(i,:);
            trainingSet.labels(index,:) = labels(i,:);
            index = index + 1;
        end
        index = 1;
        for i=2:2:sampleSize
            testSet.images(index,:) = images(i,:);
            testSet.labels(index,:) = labels(i,:);
            index = index+1;
        end
        
        accuracy(t) = modelAccuracyHH_SVM(trainingSet, testSet);
        disp(accuracy(t));
    end
end
