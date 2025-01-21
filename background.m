
img = imread('pic.png');

gray_img = 0.2989 * img(:, :, 1) + 0.5870 * img(:, :, 2) + 0.1140 * img(:, :, 3);

threshold = max(gray_img(:)) * 0.9; 
binary_mask = gray_img > threshold;

binary_mask = ~binary_mask;

binary_mask_repeated = repmat(binary_mask, [1, 1, 3]);
background_removed = uint8(binary_mask_repeated) .* img;

figure;
subplot(1, 3, 1), imshow(img), title('Original Image');
subplot(1, 3, 3), imshow(background_removed), title('Background Removed');