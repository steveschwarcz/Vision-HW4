% Declare the checkerboard
S = [1 1 1 0 0 0 1 1 1;
    1 1 1 0 0 0 1 1 1;
    1 1 1 0 0 0 1 1 1;
    0 0 0 1 1 1 0 0 0;
    0 0 0 1 1 1 0 0 0;
    0 0 0 1 1 1 0 0 0;
    1 1 1 0 0 0 1 1 1;
    1 1 1 0 0 0 1 1 1;
    1 1 1 0 0 0 1 1 1];

T = [1 0 0;
    0 1 1;
    0 1 1];

M = [1 1 1;
    1 1 0;
    1 1 0];

D = ssd(S, T, M);
matches = findmatches(S, T, M);

T2 = [1 1 1;
    0 0 0;
    0 0 0];

M2 = [1 1 1;
    1 1 1;
    0 0 1];

matches2 = findmatches(S, T2, M2);

window = 5;
image = growimage(100, 100, S, window);

figure, imshow(image);
imwrite(imresize(image, 2), 'CB_w5.png');

window = 7;
image = growimage(100, 100, S, window);

figure, imshow(image);
imwrite(imresize(image, 2), 'CB_w7.png');

window = 9;
image = growimage(100, 100, S, window);

figure, imshow(image);
imwrite(imresize(image, 2), 'CB_w9.png');