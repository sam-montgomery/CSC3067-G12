function [images, labels] = loadTrainingDatasetEE()
    imagesFolder = 'images';
    noOfPosFiles = 0;

    if ~isfolder(imagesFolder)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', imagesFolder);
        uiwait(warndlg(errorMessage));
    end

    %load positive files
    posFilePattern = fullfile(imagesFolder, '\pos\*.jpg'); % Change to whatever pattern you need.
    posFiles = dir(posFilePattern);

    for i=1:length(posFiles)
        fullFileName = fullfile(posFiles(i).folder, posFiles(i).name);
        %pre processing function
        greyImPos = im2gray(imread(fullFileName));
        eeIm = edge(greyImPos);
        images(i,:) = reshape(eeIm, 1, []);
        images(i,:) = imread(fullFileName);
        labels(i,1) = 1;
        noOfPosFiles = i;
    end

    %load negative files
    negFilePattern = fullfile(imagesFolder, '\neg\*.jpg'); % Change to whatever pattern you need.
    negFiles = dir(negFilePattern);

    for i=1:length(negFiles)
        fullFileName = fullfile(negFiles(i).folder, negFiles(i).name);
        %pre processing function
        greyImNeg = im2gray(imread(fullFileName));
        eeIm = edge(greyImNeg);
        index = i + noOfPosFiles;
        images(index, :) = reshape(eeIm, 1, []);
        labels(index,1) = -1;
    end
   images = double(images);
end
