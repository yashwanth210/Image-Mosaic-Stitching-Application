%%  This .m file takes input of first and second images which were 
%% transformed to new dimention and convert it to first image dimension


clc
clear all
close all


load('source.mat','source_image');
load('target.mat','target_image');
load('output_data.mat','output_data');
load('hmat.mat','h');
% final_image;
siz1=size(source_image);
for j=1:1:output_data(3,1)
    for i=1:1:siz1(1);
        if i<=size(source_image,1) && j<=size(source_image,2)
        final_image(i,j)=source_image(i,j);
        end
    end
end
figure;
Iint=imread('im1.jpg');
imshow(rgb2gray(Iint));
figure;
Iint=imread('im2.jpg');
imshow(rgb2gray(Iint));

siz=size(target_image);
for i=output_data(3,1):1:siz(2);
    for j=1:1:siz(1);
        final_image(j,i)=(target_image(j,i));
        
    end
end


% figure;
% imshow(target_image(320:siz(1),470:siz(2)),[]);
figure;
imshow(final_image,[]);


temp=size(final_image);
y332=temp(1);
x592=temp(2);

h=h^-1;
for i=1:1:x592+1000 
    for j=1:1:y332+1000
        xf=(h(1,1)*i+h(1,2)*j+h(1,3))/(h(3,1)*i+h(3,2)*j+h(3,3));
        yf=(h(2,1)*i+h(2,2)*j+h(2,3))/(h(3,1)*i+h(3,2)*j+h(3,3));
        xf=round(xf);
        yf=round(yf);
        if(xf<=0 || yf<=0 || xf>=x592 || yf>=y332)
            
        else
             final_ans1111(j,i)=final_image(yf,xf);
        end
    end
end
figure;
imshow(final_ans1111,[]);