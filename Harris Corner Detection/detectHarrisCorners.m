

function [corners, R] = detectHarrisCorners(image, S, N ,D, M)

%Step1 start
img = imagesmooth(image,S);
%Step1 End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step2 Start
dx = [-1 0 1; -1 0 1; -1 0 1]; 
    dy = dx';
    
    % Image derivatives
    Ix = conv2(img, dx, 'same');    
    Iy = conv2(img, dy, 'same');    

%Gx = conv2((conv2(image,a)),b);
%Gy = conv2((conv2(image,c)),d);
g = fspecial('gaussian', N, S);
%Step2 End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step3a Start
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy; 
%Step 3a End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step3b Start

 Sx2 = conv2(Ix2, g, 'same'); 
 Sy2 = conv2(Iy2, g, 'same');
Sxy = conv2(Ixy, g, 'same');

%Step 3b End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 3c Start
% We dont find H value matrix for every pixel. We just define it during R
% calculation.

%Step 3C End
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 3d Start
R = zeros(size(Sx2));
K = 0.05;
for i=1:size(Sx2,1)
    for j=1:size(Sx2,2)
        H = [ Sx2(i,j) Sxy(i,j); Sxy(i,j) Sy2(i,j)] ;
        R(i,j) = det(H) - K*(trace(H).^2);
    end
end
%Step 3d end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 4 Start
% Time  to find Max points from R matrix
% Find the max value pixel coordinates and mark it and zero that point and 
% its neighbours. then find the max value coordinates again. repeat the
% process until we find the M values.
%imshow(R,[]);

corners = maxvalues(R,D,M);

%disp(size(find(tempR~=0)));
%figure(7); imshow(R,[]);
%figure(8); imshow(corners,[]);
%figure(9), imagesc(img1), axis image, colormap(gray), hold on

%return the marked image as corners.


%Step 4 End
%END
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









end

