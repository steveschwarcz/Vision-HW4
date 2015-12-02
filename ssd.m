function [ D ] = ssd( S, T, M )
% SSD Computes the sum of squared differences for an image S, 
% using template T with mask M.

D = zeros(size(S, 1), size(S, 2));
S = double(S);
SM2 = imfilter(S.^2, M, 'same');
for i = 1:size(S, 3) % Compute SSD for each channel (RGB) and sum
    TM = M.*T(:, :, i); % M .* T
    TM2 = sum(sum(TM.*T(:, :, i))); % sum of M .* T .* T
    TS = imfilter(S(:, :, i), TM, 'same');
    D = D + TM2 + SM2(:, :, i) - 2*TS;
end

end