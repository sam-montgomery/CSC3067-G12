function [images, labels] = loadTrainingDatasetHOG()
    %addpath ..\images\
    imagesFolder = '..\images';
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
        posHOG = hog_feature_vector(imread(fullFileName));
        images(i,:) = posHOG;
        labels(i,1) = 1;
        noOfPosFiles = i;
    end

    %load negative files
    negFilePattern = fullfile(imagesFolder, '\neg\*.jpg'); % Change to whatever pattern you need.
    negFiles = dir(negFilePattern);

    for i=1:length(negFiles)
        fullFileName = fullfile(negFiles(i).folder, negFiles(i).name);
        %pre processing function
        negHOG = hog_feature_vector(imread(fullFileName));
        index = i + noOfPosFiles;
        images(index,:) = reshape(negHOG, 1, []);
        labels(index,1) = -1;
    end
   images = double(images);
end
