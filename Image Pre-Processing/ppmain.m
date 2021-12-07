clear all;
close all;

testDataset = loadTestDataset();
image = testDataset.images(1,1);

subplot(1,2,1);
imshow(cell2mat(image));
imageEE = edge(cell2mat(image), "Sobel", "horizontal");
subplot(1,2,2);
imshow(imageEE);