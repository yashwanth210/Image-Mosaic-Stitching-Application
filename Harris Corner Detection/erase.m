function [ R ] = erase( R,x,y,D )

for i=x-D:x+D
    for j=y-D:y+D
        if(i>0 && j>0)
        R(i,j) = -inf;
        end
    end
end


end

