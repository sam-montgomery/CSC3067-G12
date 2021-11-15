function prediction = testNN(testImage, modelNN)
    dEucIndex = 0;
    dEucMin = 1000000;

    for i=1:length(modelNN.neighbours)
        dEuc = EuclideanDistance(testImage, modelNN.neighbours(i,:));

        if(dEuc < dEucMin)
            dEucIndex = i;
            dEucMin = dEuc;
        end
    end

    prediction = modelNN.labels(dEucIndex); 
end
