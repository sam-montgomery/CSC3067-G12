function testDataset = loadTestDataset()
    
    fp = fopen('test.dataset', 'rb');
    assert(fp ~= -1, ['Could not open ', 'test.dataset', '']);
    
    line1 = fscanf(fp,'%s',1);
    
    noOfTests = fscanf(fp, '%d', 1);

    for i=1:noOfTests
    
        imageName = fscanf(fp,'%s',1);
        noOfPedestrians = fscanf(fp, '%d', 1);
        BBs = [];
        for j=1:noOfPedestrians
            for k=1:4
                BBs(k) = fscanf(fp, '%f', 1); 
            end
            fscanf(fp, '%f', 1); 
            testDataset.BBs(i,:) = BBs;
        end
        [fPath, fName, fExt] = fileparts(imageName);
        imgLocation = "pedestrian/" + fName + fExt;
        greyIm = rgb2gray(imread(imgLocation));
        testDataset.images{i} = greyIm;
        testDataset.noOfPedestrians(i,:) = noOfPedestrians;
    end

end