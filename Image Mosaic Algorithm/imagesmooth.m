function [ image ] = imagesmooth( image, S )
halfwidth = 3*S;
[xx,yy] = meshgrid(-halfwidth:halfwidth, -halfwidth:halfwidth);
gau = exp(-1/(2*S^2) * (xx.^2 + yy.^2));
size(gau);

image = conv2(image, gau); %Smoothed Image


end

