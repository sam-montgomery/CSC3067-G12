%loads dataset of full images ensuring half is positive and half is
%negative

function [images, labels] = loadTrainingDataset(samplesize)
    imagesFolder = '..\images';
    noOfPosFiles = 0;

    if ~isfolder(imagesFolder)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', imagesFolder);
        uiwait(warndlg(errorMessage));
    end

    %load positive files
    posFilePattern = fullfile(imagesFolder, '\pos\*.jpg'); % Change to whatever pattern you need.
    posFiles = dir(posFilePattern);
    
    randI = randi(size(posFiles, 1), 1, samplesize);

    for i=1:samplesize/2
        fullFileName = fullfile(posFiles(randI(i)).folder, posFiles(randI(i)).name);
        %pre processing function
        greyImPos = rgb2gray(imread(fullFileName));
        
        images(i,:) = reshape(greyImPos, 1, []);
        labels(i,1) = 1;
        noOfPosFiles = i;
    end

    %load negative files
    negFilePattern = fullfile(imagesFolder, '\neg\*.jpg'); % Change to whatever pattern you need.
    negFiles = dir(negFilePattern);

    randI = randi(size(negFiles, 1), 1, samplesize);
    for i=1:samplesize/2
        fullFileName = fullfile(negFiles(randI(i)).folder, negFiles(randI(i)).name);
        %pre processing function
        greyImNeg = im2gray(imread(fullFileName));
        index = i + noOfPosFiles;
        images(index,:) = reshape(greyImNeg, 1, []);
        labels(index,1) = -1;
    end
   images = double(images);
end
