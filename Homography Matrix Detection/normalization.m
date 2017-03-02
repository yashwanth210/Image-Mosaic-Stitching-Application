function [ x,y ] = normalization( x,y )

% FInding the Center of Mass
com_x = sum(x)/size(x,1);
com_y = sum(y)/size(y,1);

% Shifting the Center of mass to origin and shifting 
% all points according to Center of Mass

for i=1:size(x,1)
     x(i,1) = x(i,1) - com_x;
     y(i,1) = y(i,1) - com_y;
end

com_x = 0;
com_y = 0;

% FInding the sum of distance from all points to COM 
distance = 0;
for i=1: size(x,1)
    distance = distance + sqrt(x(i)^2 + y(i)^2);
end

% Finding the average Distance

distance = distance/ size(x,1);

scale = sqrt(2)/distance;

for i=1:size(x,1)
    x(i,1) = scale * x(i,1);
    y(i,1) = scale * y(i,1);

end

