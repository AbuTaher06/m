
image = imread('img.png');

grayImage = rgb2gray(image);

threshold = graythresh(grayImage); 
binaryImage = imbinarize(grayImage, threshold); 

figure;
subplot(1, 2, 1), imshow(grayImage), title('Grayscale Image');
subplot(1, 2, 2), imshow(binaryImage), title(['Binary Image (Otsu Threshold = ', num2str(threshold), ')']);
