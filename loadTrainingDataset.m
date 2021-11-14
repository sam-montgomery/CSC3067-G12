function [images, label] = loadTrainingDataset()
    imagesFolder = 'images';

    if ~isfolder(imagesFolder)
        errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', imagesFolder);
        uiwait(warndlg(errorMessage));
    end

    posFilePattern = fullfile(imagesFolder, '\pos\*.jpg'); % Change to whatever pattern you need.
    posFiles = dir(posFilePattern);

    for i=1:length(posFiles)
        fullFileName = fullfile(posFiles(i).folder, posFiles(i).name);
        greyIm = rgb2gray(imread(fullFileName));
    end
end
