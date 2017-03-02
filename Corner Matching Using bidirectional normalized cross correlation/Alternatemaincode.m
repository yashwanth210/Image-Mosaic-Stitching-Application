clc;

close all;

%image = imread('checkboard.jpg'); %This is a color image
%image = imread('rolla.jpg');

im1 = imread('1.tif');
im2 = imread('2.tif');


im1_temp = im1;
im2_temp = im2;
im1 = rgb2gray(im1);
im2 = rgb2gray(im2);
%im1_temp = im1;

%im2_temp = im2;


im1 = double((im1));
im2 = double((im2));
S=1;
N = 7;
D = 10;
M = 50;

[corners1, R1] = detectHarrisCorners(im1, S, N ,D, M);
[corners2, R2] = detectHarrisCorners(im2, S, N ,D, M);

corners1 = trim(corners1);
corners2 = trim(corners2);
%figure(1);imshow(R1,[]);% showing the R matrix as a bit image
%figure(2);imshow(R2,[]);

weightmatrix1 = markcorners(corners1,im1);
weightmatrix2 = markcorners(corners2,im2);

%now campare each weights
[pointsinI1,pointsinI2]=compareweights(weightmatrix1, weightmatrix2);


figure; ax = axes;
showMatchedFeatures(im1_temp,im2_temp, pointsinI1, pointsinI2,'montage','Parent',ax);
title(ax, 'Candidate point matches');
legend(ax, 'Matched points 1','Matched points 2');
%showMatchedFeatures(im1_temp,im2_temp, pointsinI2, pointsinI1);

%figure(3);imshow(corners1,[]);    % Showing the best M corner points
%figure(4);imshow(corners2,[]);

%figure(5), imagesc(im_temp1), axis image, colormap(gray), hold on
%[x,y]=find(corners~=0);                       % Showing the edges in boxes
%plot(y, x, 'ys','MarkerSize',10);

%figure(6), imagesc(im_temp2), axis image, colormap(gray), hold on
%[x,y]=find(corners~=0);                       % Showing the edges in boxes
%plot(y, x, 'ys','MarkerSize',10);