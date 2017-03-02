function [matrix ] = markcorners( R,im )

count = sum(sum(R));

matrix = zeros(count,4);
index=1;
for i=1:size(R,1)
    for j=1:size(R,2)
        if R(i,j)==1
            matrix(index,1)= j;
            matrix(index,2)= i;
            matrix(index,3)= find_weight(im,i,j);
            index=index+1;
        end
    end
end





end

