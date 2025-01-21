image = imread('img.png');

if size(image, 3) == 3
    grayImage = rgb2gray(image);
else
    grayImage = image;
end

histCounts = zeros(1, 256);
for i = 0:255
    histCounts(i + 1) = sum(grayImage(:) == i);
end

totalPixels = numel(grayImage);
probabilities = histCounts / totalPixels;

maxVariance = 0;
optimalThreshold = 0;

for t = 1:256
    pBackground = sum(probabilities(1:t));
    meanBackground = sum((0:t-1) .* probabilities(1:t)) / (pBackground + eps);

    pForeground = sum(probabilities(t+1:end));
    meanForeground = sum((t:255) .* probabilities(t+1:end)) / (pForeground + eps);

    betweenClassVariance = pBackground * pForeground * (meanBackground - meanForeground)^2;

    if betweenClassVariance > maxVariance
        maxVariance = betweenClassVariance;
        optimalThreshold = t - 1;
    end
end

binaryImage = grayImage >= optimalThreshold;

figure;
subplot(1, 2, 1), imshow(grayImage), title('Grayscale Image');
subplot(1, 2, 2), imshow(binaryImage), title(['Binary Image (Otsu Threshold = ', num2str(optimalThreshold), ')']);
