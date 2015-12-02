function [ matches ] = findmatches( S, T, M )
% FINDMATCHES Finds all pixels in S that best match the template T, 
% using mask M.

totalWeight = sum(sum(M)); % Total weight

D = ssd(S, T, M) / totalWeight; % SSD divided by weight

% Use a threshold of .1
threshold = min(min(D)) * 1.1;

% Extra check to handle very small negative approximations of 
% zero, which can happen if an ssd value should be 0.
if threshold < 0
    threshold = 1e-4;
end

matches = (D <= threshold);

end