%%  This .m file takes all corners from the two images and calculates H matrix.
%   With help of 1 H matrix we transform all corners of one image to
%   another.
%   After checking the accuracy(number of corners matched) we choose the H
%   with the highest accuracy.
%   Finally this .m file generates one H matrix.

clc
clear all
close all
%load('line_points_final.mat','line_points_final');
[p1,p2] = get_matching_corners();
p = [p1 p2];
%p=line_points_final;
I1=imread('im1.jpg');
I2=imread('im2.jpg');

if(p(1,1)==0 && p(1,2)==0 && p(1,3)==0 && p(1,4)==0)
p(1,:)=[];
end
maxx=0;
for i1=1:length(p)-3
    for i2=i1+1:length(p)-2
        for i3=i2+1:length(p)-1
            for i4=i3+1:length(p)
          
%                 a=[p(i1,1:2);p(i2,1:2);p(i3,1:2);p(i4,1:2)];
%                 b=[p(i1,3:4);p(i2,3:4);p(i3,3:4);p(i4,3:4)];
%                 
                a=[p(i1,1) p(i1,2);p(i2,1) p(i2,2);p(i3,1) p(i3,2);p(i4,1) p(i4,2)];
                b=[p(i1,3) p(i1,4);p(i2,3) p(i2,4);p(i3,3) p(i3,4);p(i4,3) p(i4,4)];
                
                %%%%%%%%%--cal H--%%%%%%%%%%%%%%%
                
                
 for i=1:4
   
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
if((det(H)>=-exp(-5) && det(H)<=exp(-5)) || (det(H)>=-exp(10) && det(H)<=exp(10)))
%    a
%    b
    continue;
end

temp_h=H^-1*y;

h=[temp_h(1,1) temp_h(2,1) temp_h(3,1);temp_h(4,1) temp_h(5,1) temp_h(6,1);temp_h(7,1) temp_h(8,1) 1];



              
                %%%%%%%%%--cal H--%%%%%%%%%%%%%%%
                
    
    temp_b=zeros(1,2);            
for i5=1:1:length(p)
   
    temp=h*[p(i5,1);p(i5,2);1];
    temp_b=[temp_b;temp(1)/temp(3) temp(2)/temp(3)];
    
end
count=0;
temp_b(1,:)=[];
var=4;
% for i5=1:1:length(temp_b)
    for i6=1:1:length(p)
        if(temp_b(i6,1)<=p(i6,3)+var && temp_b(i6,1)>=p(i6,3)-var && temp_b(i6,2)<=p(i6,4)+var && temp_b(i6,2)>=p(i6,4)-var)
%         if(temp_b(i5,1)==p(i6,1) && temp_b(i5,2)==p(i6,2))  
           count=count+1; 
        end
    
    end
% end


      if(count>maxx)
         maxx=count;
         h_max=h;
         temp_b_max=temp_b;
         a_max=a;
         b_max=b;
      end    
            end
        end
    end
end

save('h_max.mat','h_max');



figure; ax = axes;
showMatchedFeatures(I1,I2, p1, p2,'montage','Parent',ax);



sizee=size(I1);

a6();