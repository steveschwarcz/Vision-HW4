 function [ I ] = growimage( height, width, S, w )
%GROWIMAGE Grows a new image of specified height and width from a 
% sample image S.  The value w determines the size of the template 
% window when matching textures.

% Initialize an unfilled image
I = zeros([height, width, size(S, 3)]);

% Filled neighbors holds at each index the number of filled 
% neighbors for each pixel. Negative values mean the pixel itself
% has been filled.
filled_neighbors = zeros(size(I, 1), size(I, 2));

% Seed the upper left of the image with some filled pixels.
xS = randi([0 (size(S, 1) - 3)], 1);
yS = randi([0 (size(S, 2) - 3)], 1);

for i = 1:3
    for j = 1:3
        xIdx = floor(height / 2) + i;
        yIdx = floor(width / 2) + j;
        
        I(xIdx, yIdx, :) = S(xS + i, yS + j);
        filled_neighbors = fillpixel(xIdx, yIdx, filled_neighbors, w);
    end
end

% Set up a waitbar for showing progress
h = waitbar(0,'Generating new texture...');
cleaner = onCleanup(@() close(h));

total_pixels = width * height;
processed_pixels = 0;

while max(max(filled_neighbors)) > 0 
    % Sort filled neighbors by largest first
    neighbors = sort(find(filled_neighbors > 1), 'descend');
    
    % Populate each neighbor
    for i = 1:size(neighbors, 1)
        [x, y] = ind2sub(size(I), neighbors(i));
        
        % Get the template and mask from the filled in neighbors
        [T, M] = maketemplate(x, y, filled_neighbors, I, w);
        
        % Find the best matches
        best_matches = findmatches(S, T, M);
        
        % Pick a best match index at random
        best_match = datasample(find(best_matches), 1);
        
        % Fill this pixel with the best match
        [xS, yS] = ind2sub(size(S), best_match);
        I(x, y) = S(xS, yS);
        filled_neighbors = fillpixel(x, y, filled_neighbors, w);
        
        % Update progress
        processed_pixels = processed_pixels + 1;
        waitbar(processed_pixels / total_pixels);
    end;
    
end;

end