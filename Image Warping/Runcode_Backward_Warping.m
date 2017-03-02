%Assignment 5 for Computer Vision
% Yashwanth Telekula
clear all;
close all;
clc;

I1 = rgb2gray(imread('Img1.jpg'));
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

p1 = H*[1;1;1];
p1_x = p1(1)/p1(3);
p1_y = p1(2)/p1(3);

p2 = H*[srcnrows;1;1];
p2_x = p2(1)/p2(3);
p2_y = p2(2)/p2(3);

p3 = H*[1;srcncols;1];
p3_x = p3(1)/p3(3);
p3_y = p3(2)/p3(3);

p4 = H*[srcnrows;srcncols;1];
p4_x = p4(1)/p4(3);
p4_y = p4(2)/p4(3);

p_x_min = min(min(p1_x,p2_x),min(p3_x,p4_x));
p_y_min = min(min(p1_y,p2_y),min(p3_y,p4_y));

p_x_max = max(max(p1_x,p2_x),max(p3_x,p4_x));
p_y_max = max(max(p1_y,p2_y),max(p3_y,p4_y));

scale_x = p_x_max - p_x_min;
scale_y = p_y_max - p_y_min;

destnrows=round(scale_x);
destncols=round(scale_y);

%warpedSrc = zeros(destncols, destnrows);
warpedSrc = zeros(size(I2));

%H = inv(H);
for x = 1:size(I2,2)
for y = 1:size(I2,1)
p = [x; y; 1];
pprime=H\p;
xprime = round(pprime(1)/pprime(3) );
yprime = round(pprime(2)/pprime(3) );

if yprime>=1 && yprime<=size(I1,1) && xprime>=1 && xprime<=size(I1,2)
warpedSrc(y,x)= I1(yprime,xprime);
end

end
end
figure; imshow(warpedSrc,[]);