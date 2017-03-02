function [ value ] = find_weight( R,i,j )


value = -100;

if i-1>1 && j-1>1 && i+1<=size(R,1) && j+1<= size(R,2)
center = R(i,j);
value =0;
        index = 7;
        % for 1st pixel
        if R(i-1,j-1) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
        end
        % For 2nd Pixel
          if R(i,j-1) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
          end
          
          % For 3nd Pixel
            if R(i+1,j-1) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
            end
            
            % For 4nd Pixel
          if R(i+1,j) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
          end
          
          % For 5th Pixel
          if R(i+1,j+1) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
          end
          
          % For 6th Pixel
          if R(i,j+1) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
          end
          
          % For 7th Pixel
          if R(i-1,j+1) >= center
          value = value + 2^index;
          index = index-1;
        else index = index - 1;
          end
          
          % For 8th Pixel
          if R(i-1,j) >= center
          value = value + 2^index;
          end
        end

        


end