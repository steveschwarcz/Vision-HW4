function [ matches ] = findmatches( S, T, M )
%FINDMATCHES Finds all pixels in S that best match the template T, using
% mask M.

totalWeight = sum(sum(M));

D = ssd(S, T, M) / totalWeight;

threshold = min(min(D)) * 1.1;

matches = D <= threshold;

end

