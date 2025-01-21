
originalImage = imread('img.png');

grayImage = rgb2gray(originalImage);

figure;
subplot(3, 1, 1);
imshow(grayImage);
title('Original Grayscale Image');

hSmooth = fspecial('gaussian', [5, 5], 2); 
smoothedImage = imfilter(grayImage, hSmooth, 'replicate');

subplot(3, 1, 2);
imshow(smoothedImage);
title('Smoothed Image');

hSharp = fspecial('laplacian', 0.2); 
sharpenedImage = imfilter(grayImage, hSharp, 'replicate');
sharpenedImage = imsubtract(grayImage, sharpenedImage); 
subplot(3, 1, 3);
imshow(sharpenedImage);
title('Sharpened Image');

