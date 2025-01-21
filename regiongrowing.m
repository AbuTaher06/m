
input_image = imread('img.png');
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end

input_image = double(input_image);

figure, imshow(uint8(input_image)), title('Select a Seed Point');
[x, y] = ginput(1);
x = round(x); y = round(y);


seed_value = input_image(y, x);
threshold = 10; 
segmented_image = zeros(size(input_image));
visited = false(size(input_image));
queue = [y, x]; 
while ~isempty(queue)
    current_pixel = queue(1, :);
    queue(1, :) = [];
    row = current_pixel(1);
    col = current_pixel(2);
    
    if visited(row, col)
        continue;
    end
    
    visited(row, col) = true;
    
    if abs(input_image(row, col) - seed_value) <= threshold
        segmented_image(row, col) = 1; 
        
        for i = -1:1
            for j = -1:1
                if i == 0 && j == 0
                    continue;
                end
                new_row = row + i;
                new_col = col + j;
                if new_row > 0 && new_row <= size(input_image, 1) && ...
                   new_col > 0 && new_col <= size(input_image, 2) && ...
                   ~visited(new_row, new_col)
                    queue = [queue; new_row, new_col]; %#ok<AGROW>
                end
            end
        end
    end
end

segmented_image = uint8(segmented_image * 255);
figure;
subplot(1, 2, 1), imshow(uint8(input_image)), title('Original Image');
subplot(1, 2, 2), imshow(segmented_image), title('Segmented Region');