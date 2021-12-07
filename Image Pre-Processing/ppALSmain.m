clear all;
close all;

testDataset = loadTestDataset();
image = testDataset.images(1,1);

subplot(1,3,1);
imshow(cell2mat(image));
imageALS = enhanceBrightness(cell2mat(image), 50);
subplot(1,3,2);
imshow(imageALS);
imageALS = enhanceContrastPL(imageALS);
subplot(1,3,3);
imshow(imageALS);