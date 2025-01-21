
image = imread('img.png');
if size(image, 3) == 3
    image = rgb2gray(image);
end

noisyGaussian = imnoise(image, 'gaussian', 0, 0.01);

noisySaltPepper = imnoise(image, 'salt & pepper', 0.02);

medianFiltered = medfilt2(noisySaltPepper, [3 3]);

h = fspecial('gaussian', [3 3], 1);
gaussianFiltered = imfilter(noisyGaussian, h);

wienerFilteredGaussian = wiener2(noisyGaussian, [5 5]);
wienerFilteredSaltPepper = wiener2(noisySaltPepper, [5 5]);

figure;

subplot(3, 3, 1);
imshow(image);
title('Original Image');

subplot(3, 3, 2);
imshow(noisyGaussian);
title('Gaussian Noise');

subplot(3, 3, 3);
imshow(noisySaltPepper);
title('Salt-and-Pepper Noise');

subplot(3, 3, 4);
imshow(medianFiltered);
title('Median Filtered');

subplot(3, 3, 5);
imshow(gaussianFiltered);
title('Gaussian Filtered');

subplot(3, 3, 6);
imshow(wienerFilteredGaussian);
title('Wiener (Gaussian Noise)');

subplot(3, 3, 7);
imshow(wienerFilteredSaltPepper);
title('Wiener (Salt-Pepper Noise)');

