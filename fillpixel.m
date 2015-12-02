 function [ filled_neighbors ] = fillpixel( x, y, filled_neighbors, w )
%FILLPIXEL Updates the value of all adjacent pixels to the one at 
% (x, y) to indicate that the pixel at (x, y) has been filled.  
% Negative values of filled_neighbors indices are filled 
% themselves.

% Update all the neighbors to inform them that the pixel is filled
for i = -1:1
    for j = -1:1
        xIdx = x + i;
        yIdx = y + j;
        
        % Check bounds
        if xIdx <= size(filled_neighbors, 1) && xIdx > 0 ...
                && yIdx <= size(filled_neighbors, 2) && yIdx > 0
            
            % Update neighbors
            filled_neighbors(xIdx, yIdx) = ...
                filled_neighbors(xIdx, yIdx) + 1;
        end
    end
end

% Set the current filled value low enough that it won't be reused
filled_neighbors(x, y) = -100;

end