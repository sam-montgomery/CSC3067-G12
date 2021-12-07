function [TP3, FP3, TN3, FN3, TP5, FP5, TN5, FN5, TP10, FP10, TN10, FN10] = testMetricsKNN(sampleSize)

    %K = 3
    for t=1:3
        %use full image
        [images, labels] = loadTrainingDataset(sampleSize);

        %splits images and labels into testing and training set
        index = 1;
        for i=1:2:size(images,1)
            testSet.images(index,:) = images(i,:);
            testSet.labels(index,:) = labels(i,:);
            index = index+1;
        end
        index = 1;
        for i=2:2:size(images,1)
            trainingSet.images(index, :) = images(i,:);
            trainingSet.labels(index, :) = labels(i,:);
            index = index + 1;
        end

        [TP3(t), FP3(t), TN3(t), FN3(t)] = modelAccuracyHHKNN(trainingSet, testSet, 3);
        %disp(accuracy(t));
        %disp(TP(t));
        %disp(FP(t));
        %disp(TN(t));
        %disp(FN(t));
    end

    %K = 5
    for t=1:3
        %use full image
        [images, labels] = loadTrainingDataset(sampleSize);

        %splits images and labels into testing and training set
        index = 1;
        for i=1:2:size(images,1)
            testSet.images(index,:) = images(i,:);
            testSet.labels(index,:) = labels(i,:);
            index = index+1;
        end
        index = 1;
        for i=2:2:size(images,1)
            trainingSet.images(index, :) = images(i,:);
            trainingSet.labels(index, :) = labels(i,:);
            index = index + 1;
        end
        
        [TP5(t), FP5(t), TN5(t), FN5(t)] = modelAccuracyHHKNN(trainingSet, testSet, 5);
        %disp(accuracy(t));
        %disp(TP(t));
        %disp(FP(t));
        %disp(TN(t));
        %disp(FN(t));
    end

    %K = 10
    for t=1:3
        %use full image
        [images, labels] = loadTrainingDataset(sampleSize);

        %splits images and labels into testing and training set
        index = 1;
        for i=1:2:size(images,1)
            testSet.images(index,:) = images(i,:);
            testSet.labels(index,:) = labels(i,:);
            index = index+1;
        end
        index = 1;
        for i=2:2:size(images,1)
            trainingSet.images(index, :) = images(i,:);
            trainingSet.labels(index, :) = labels(i,:);
            index = index + 1;
        end
        
        [TP10(t), FP10(t), TN10(t), FN10(t)] = modelAccuracyHHKNN(trainingSet, testSet, 10);
        %disp(accuracy(t));
        %disp(TP(t));
        %disp(FP(t));
        %disp(TN(t));
        %disp(FN(t));
    end
end
