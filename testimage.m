function [] = testimage(imgpath)
S = imread(imgpath);

S = double(S) / 255;

window = 9;
image = growimage(100, 100, S, window);

figure, imshow(image);
imwrite(imresize(image, 2), 'CB_w9_color.png');
end