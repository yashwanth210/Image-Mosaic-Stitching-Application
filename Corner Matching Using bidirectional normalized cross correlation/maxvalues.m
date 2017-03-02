function [ corners ] = maxvalues( R,D,M )

corners = zeros(size(R));
for i=1:M
[num, idx] = max(R(:));
[x, y] = ind2sub(size(R),idx);
%%%%%%%%%%%%
corners(x,y) = 1;

R = erase(R,x,y,D);
end
end

