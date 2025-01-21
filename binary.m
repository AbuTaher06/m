
originalImage = imread('img.png');
grayImage = rgb2gray(originalImage);

threshold = sum(grayImage(:))/length(grayImage(:));

binaryImage = grayImage >= threshold;

subplot(1, 2, 1), imshow(grayImage), title('Grayscale Image');
subplot(1, 2, 2), imshow(binaryImage), title('Binary Image (Thresholding)');