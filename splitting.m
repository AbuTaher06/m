function splitting()
    
    image = imread('img.png');
    if size(image, 3) == 3
        image = rgb2gray(image); 
    end
    
    threshold = 20; 

    segmented_image = split_and_merge(image, threshold);

    imwrite(segmented_image, 'segmented_image.png');
    imshow(segmented_image, []);
    title('Segmented Image');
end

function is_homogeneous = isHomogeneous(region, threshold)
    min_val = min(region(:));
    max_val = max(region(:));
    is_homogeneous = (max_val - min_val) <= threshold;
end

function segmented = recursive_split(region, threshold)
    [rows, cols] = size(region);

    if rows <= 1 || cols <= 1
        segmented = zeros(size(region), 'uint8');
        return;
    end

    if isHomogeneous(region, threshold)
        segmented = ones(size(region), 'uint8');
        return;
    end

    mid_row = floor(rows / 2);
    mid_col = floor(cols / 2);

    top_left = region(1:mid_row, 1:mid_col);
    top_right = region(1:mid_row, mid_col+1:end);
    bottom_left = region(mid_row+1:end, 1:mid_col);
    bottom_right = region(mid_row+1:end, mid_col+1:end);

    segmented = zeros(size(region), 'uint8');

    segmented(1:mid_row, 1:mid_col) = recursive_split(top_left, threshold);
    segmented(1:mid_row, mid_col+1:end) = recursive_split(top_right, threshold);
    segmented(mid_row+1:end, 1:mid_col) = recursive_split(bottom_left, threshold);
    segmented(mid_row+1:end, mid_col+1:end) = recursive_split(bottom_right, threshold);
end

function segmented_image = split_and_merge(image, threshold)
    segmented_image = recursive_split(image, threshold);

end