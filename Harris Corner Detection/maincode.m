clc;
clear all;
close all;

%image = imread('checkboard.jpg'); %This is a color image
image = imread('rolla.jpg');
%image = imread('brickwall.jpg');
%image = imread('rocket.jpg');
im_temp = image;
image = double(rgb2gray(image));
S=1;
N = 7;
D = 10;
M = 100;

[corners, R] = detectHarrisCorners(image, S, N ,D, M);

figure(1);imshow(R,[]); % showing the R matrix as a bit image

figure(2);imshow(corners,[]);    % Showing the best M corner points

figure(3), imagesc(im_temp), axis image, colormap(gray), hold on
[x,y]=find(corners~=0);                       % Showing the edges in boxes
plot(y, x, 'ys','MarkerSize',10);
