function [ T, M ] = maketemplate( x, y, filled_neighbors, I, w )
% MAKETEMPLATE Makes a template T and a mask M at a certain pixel.  
% The template is composed of every filled neighbor to the pixel 
% at I(x, y), and any value in the template filled in this way is 
% added to M. The value w is the height and width of M and T.

% Initialize variables.
T = zeros([w, w, size(I, 3)]);
M = zeros([w, w]); 

n = floor(w / 2);

for i = -n:n
    for j = -n:n
        xIdx = x + i;
        yIdx = y + j;

        % Check bounds and update mask at filled positions
        if xIdx <= size(filled_neighbors, 1) ...
        		&& xIdx > 0 ...
                && yIdx <= size(filled_neighbors, 2)... 
                && yIdx > 0 ...
                && filled_neighbors(xIdx, yIdx) < 0
            M(i + n + 1, j + n + 1) = 1;
            T(i + n + 1, j + n + 1, :) = I(xIdx, yIdx, :);
        end
    end
end

end