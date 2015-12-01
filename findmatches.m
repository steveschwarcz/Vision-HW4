function [ matches ] = findmatches( S, T, M )
% FINDMATCHES Finds all pixels in S that best match the template T, 
% using mask M.

totalWeight = sum(sum(M));

D = ssd(S, T, M);
% Use a threshold of .1
threshold = min(min(D)) * 1.1;

% Extra check to handle very small negative approximations of zero.
if threshold < 0
    threshold = 0;
end

matches = D <= threshold;

end