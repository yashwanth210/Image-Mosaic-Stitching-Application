function [ corners ] = trim( corners )

corners(1,:)=0;
corners(:,1)=0;
corners(2,:)=0;
corners(:,2)=0;
[x,y] = size(corners);

corners(x,:)=0;
corners(:,y)=0;
corners(x-1,:)=0;
corners(:,y-1)=0;

end

