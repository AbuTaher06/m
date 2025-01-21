% Load the image (assuming 'image.jpg' is in the current directory)
originalImage = imread('image.png');

% Generate the negative image
negativeImage = 255 - originalImage -1;

% Display the original and negative images
subplot(1, 3, 1), imshow(originalImage), title('Original Image');
subplot(1, 3, 2), imshow(negativeImage), title('Negative Image');

gray=rgb2gray(originalImage);
subplot(1, 3, 3),imshow(gray)



    