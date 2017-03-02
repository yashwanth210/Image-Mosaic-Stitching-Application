%Assignment 5 for Computer Vision
% Yashwanth Telekula
clear all;
close all;
clc;

I1 = double(rgb2gray(imread('Img1.jpg')));
I2 = rgb2gray(imread('Img2.jpg'));
% 
% N = 4;  % No of points to choose
% imshow(I1);
% [x,y] = ginput(N);
% 
% imshow(I2);
% [u,v] = ginput(N);
% % 
%  load('points.mat');
% H = Generate_homogenous_matrix(x,y,u,v);

H =[1.15446723649351 0.0469860280094242 -98.7718356195859;
-0.0585850815625497 1.20850355096465 -12.7501766788246;
-0.000315545737864621 0.000690655249184463 1];

[srcnrows, srcncols] = size(I1);



%warpedSrc = zeros(destncols, destnrows);
warpedSrc = zeros(size(I2));

%H = inv(H);
for x = 1:size(I2,2)
for y = 1:size(I2,1)
p = [x; y; 1];
pprime=H\p;
xprime = (pprime(1)/pprime(3) );
yprime = (pprime(2)/pprime(3) );

if yprime>=1 && yprime<=size(I1,1) && xprime>=1 && xprime<=size(I1,2)
x_left = floor(xprime);
x_right = ceil(xprime);
y_left = floor(yprime);
y_right = ceil(yprime);

temp1 = [x_right-xprime xprime-x_left];

temp2 = [I1(y_left,x_left) I1(y_right,x_left);
         I1(y_left,x_right) I1(y_right,x_right);];

temp3 = [y_right-yprime;
         yprime-y_left];
     
final_value = temp1*temp2*temp3;

warpedSrc(y,x)= final_value;
end

end
end
figure; imshow(warpedSrc,[]);