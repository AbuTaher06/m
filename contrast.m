
image = imread('img.png');

stretchedImage = image;

for c = 1:3
    channel = double(image(:, :, c));
    
    minIntensity = min(channel(:));
    maxIntensity = max(channel(:));
    
    stretchedImage(:, :, c) = uint8(255 * (channel - minIntensity) / (maxIntensity - minIntensity));
end

subplot(1, 2, 1), imshow(image), title('Original RGB Image');
subplot(1, 2, 2), imshow(stretchedImage), title('Contrast Stretched RGB Image');