function [] = testimage(imgpath)
S = imread(imgpath);

window = 9;
image = growimage(100, 100, S, window);

figure, imshow(image);
end