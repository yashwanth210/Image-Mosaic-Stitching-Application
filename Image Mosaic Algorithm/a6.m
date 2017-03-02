%%  This .m file takes first image and converts it to second image 
%% dimention using the previously calculated H matrix.

clc


     load('h_max.mat','h_max');
     h=h_max;
     
     h=h^-1;
I1=imread('im1.jpg');
I1=rgb2gray(I1);
sizee=size(I1);


for i=1:1:sizee(2)+1000
    for j=1:1:sizee(1)+1000
        xf=(h(1,1)*i+h(1,2)*j+h(1,3))/(h(3,1)*i+h(3,2)*j+h(3,3));
        yf=(h(2,1)*i+h(2,2)*j+h(2,3))/(h(3,1)*i+h(3,2)*j+h(3,3));
        xf=round(xf);
        yf=round(yf);
        if(xf<=0 || yf<=0 || xf>=sizee(2) || yf>=sizee(1))
            
        else
   final_ans1(j,i)=I1(yf,xf);
        end
        
        
        
    end
end
figure;
imshow(final_ans1,[]);
  
     a7();
     
          

     
     
     
     
     
     
     
     
     
     
     
     