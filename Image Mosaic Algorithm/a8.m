%% This .m file takes second image and transforms into new dimension.


clc
clear all
close all


I=(imread('im2.jpg'));
I=rgb2gray((I));
imshow(I);
temp=size(I);
y332=temp(1);
x592=temp(2);

input_data=[139 118;390 146;407 390;166 411];
%   input_data=[  83.5000  220.2500
%   316.0000  188.7500
%   316.0000  244.2500
%    85.0000  269.7500 ];
%input_data=[296 116;554 139;573 393;324 405];
     

load('output_data.mat','output_data');


    a=input_data;
    b=output_data;
    H=zeros(8,8);
for i=1:1:4
   
    H(2*i-1,1)=a(i,1);
    H(2*i,1)=0;
    
    H(2*i-1,2)=a(i,2);
    H(2*i,2)=0;
    
    H(2*i-1,3)=1;
    H(2*i,3)=0;
    
    H(2*i-1,4)=0;
    H(2*i,4)=a(i,1);
    
    H(2*i-1,5)=0;
    H(2*i,5)=a(i,2);
    
    H(2*i-1,6)=0;
    H(2*i,6)=1;
    
    H(2*i-1,7)=-a(i,1)*b(i,1);
    H(2*i,7)=-a(i,1)*b(i,2);
    
    H(2*i-1,8)=-a(i,2)*b(i,1);
    H(2*i,8)=-a(i,2)*b(i,2);
    
    y(2*i-1,1)=b(i,1);
    y(2*i,1)=b(i,2);
end

temp_h=H^-1*y;
h=[temp_h(1,1) temp_h(2,1) temp_h(3,1);temp_h(4,1) temp_h(5,1) temp_h(6,1);temp_h(7,1) temp_h(8,1) 1];


h33=1/norm(h);
h1=h*h33;


%%%---back wraping---%%%
h=h^-1;
final_ans1=zeros(y332,x592);


for i=1:1:x592+1000
    for j=1:1:y332+1000
        xf=(h(1,1)*i+h(1,2)*j+h(1,3))/(h(3,1)*i+h(3,2)*j+h(3,3));
        yf=(h(2,1)*i+h(2,2)*j+h(2,3))/(h(3,1)*i+h(3,2)*j+h(3,3));
        xf=round(xf);
        yf=round(yf);
        if(xf<=0 || yf<=0 || xf>=x592 || yf>=y332)
            
        else
         final_ans1(j,i)=I(yf,xf);
        end
        
        
        
    end
end
figure;
imshow(final_ans1,[]);

    
    target_image=final_ans1;
    save('target.mat','target_image');
    save('output_data.mat','output_data');
%     save('hmat.mat','h');
    
a9();