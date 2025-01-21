
input_image = imread('img.png'); 

input_image = rgb2gray(input_image);


pixel_count = imhist(input_image);

figure;
subplot(1, 2, 1), imshow(input_image), title('Original Image');
subplot(1, 2, 2), bar(pixel_count, 'BarWidth', 1, 'FaceColor', 'k');
xlabel('Intensity Values (0-255)');
ylabel('Frequency');
title('Histogram of the Image');
xlim([0 255]);
grid on;