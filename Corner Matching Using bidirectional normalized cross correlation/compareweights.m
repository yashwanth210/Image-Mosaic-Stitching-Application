function [MatchPointsInI1, MatchPointsInI2  ] = compareweights( weightmatrix1,weightmatrix2 )

for i=1:size(weightmatrix1,1)
    weight = weightmatrix1(i,3);
    diff = 255;
    
    for j=1:size(weightmatrix2,1)
        weight2 = weightmatrix2(j,3);
           if abs(weight-weight2) < diff
               diff = abs(weight-weight2);
               index = j;
           end
    end
    weightmatrix1(i,4) = index;
end


for i=1:size(weightmatrix2,1)
    weight = weightmatrix2(i,3);
    diff = 255;
    
    for j=1:size(weightmatrix1,1)
        weight2 = weightmatrix1(j,3);
           if abs(weight-weight2) < diff
               diff = abs(weight-weight2);
               index = j;
           end
    end
    weightmatrix2(i,4) = index;
end
MatchPointsInI1 = zeros(50,2);
MatchPointsInI2 = zeros(50,2);
counter = 1;
for k=1:size(weightmatrix1,1)
    PixelPreference = weightmatrix1(k,4);
    
    if weightmatrix2(PixelPreference,4) == k
    if abs(weightmatrix1(k,2) - weightmatrix2(PixelPreference,2)) <10
    MatchPointsInI1(counter,1) = weightmatrix1(k,1);
    MatchPointsInI1(counter,2) = weightmatrix1(k,2);
    MatchPointsInI2(counter,1) = weightmatrix2(PixelPreference,1);
    MatchPointsInI2(counter,2) = weightmatrix2(PixelPreference,2);
    counter = counter+1;
    end
    end
end
MatchPointsInI1 = MatchPointsInI1(1:counter-1,:);
MatchPointsInI2 = MatchPointsInI2(1:counter-1,:);


display(counter);









end

