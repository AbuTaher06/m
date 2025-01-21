image = imread('img.png');
grayImage = rgb2gray(image);


sigma = 1;
lowThreshold = 0.1;
highThreshold = 0.3;

edges = edge(grayImage, 'Canny', [lowThreshold, highThreshold], sigma);

figure;
subplot(1, 2, 1), imshow(image), title('Original Image');
subplot(1, 2, 2), imshow(edges), title('Canny Edge Detection');