function edgeE = edgeExtraction(im)
%EDGEDETECTION Summary of this function goes here
%   Detailed explanation goes here

% Convert RGB iamge to grayscale
if size(im,3)==3
    im=rgb2gray(im);
end

edgeE = edge(im);

end

