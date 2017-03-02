function [ pointsinI1,pointsinI2 ] = get_matching_corners(  )

im1 = imread('im1.jpg');
im2 = imread('im2.jpg');


im1_temp = im1;
im2_temp = im2;
im1 = double(rgb2gray(im1));
im2 = double(rgb2gray(im2));

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


end

