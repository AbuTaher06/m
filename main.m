image = imread('image.png');

R = image(:, :, 1);
G = image(:, :, 2);
B = image(:, :, 3);

grayImage = uint8(0.2989 * double(R) + 0.5870 * double(G) + 0.1140 * double(B));

rgbImage = cat(3, R, G, B);

subplot(2, 3, 1), imshow(image), title('Original RGB Image');
subplot(2, 3, 2), imshow(R), title('Red Channel');
subplot(2, 3, 3), imshow(G), title('Green Channel');
subplot(2, 3, 4), imshow(B), title('Blue Channel');
subplot(2, 3, 5), imshow(grayImage), title('Grayscale Image');
subplot(2, 3, 6), imshow(rgbImage), title('Reconstructed RGB Image');