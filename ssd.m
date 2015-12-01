function [ D ] = ssd( S, T, M )
% SSD Computes the sum of squared differences for an image S, 
% using template T with mask M.

TM = M.*T; % M .* T
TM2 = sum(sum(TM.*T)); % sum of M .* T .* T
SM2 = imfilter(S.^2, M, 'same');
TS = imfilter(S, TM, 'same');
D = TM2 + SM2 - 2*TS;

end