img = imread('img.png');
img_gray = rgb2gray(img);

input_image = double(img_gray);

Gx = [-1 0 1; -2 0 2; -1 0 1];
Gy = [-1 -2 -1; 0 0 0; 1 2 1];

Ix = conv2(input_image, Gx, 'same');
Iy = conv2(input_image, Gy, 'same');

edge_magnitude = sqrt(Ix.^2 + Iy.^2);
edge_magnitude = uint8(255 * mat2gray(edge_magnitude));

figure;
subplot(1, 2, 1), imshow(uint8(input_image)), title('Original Image');
subplot(1, 2, 2), imshow(edge_magnitude), title('Roberts Edge Detection');