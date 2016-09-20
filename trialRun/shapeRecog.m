function [shape]=shapeRecog(I)
%square-1,circle-2,triangle-3,hexagon-4,nothing-0
figure,imshow(I);
[r,c]=size(I);
[bw,num]=bwlabel(I);
figure,imshow(bw);
%disp(num);

bin=regionprops(bw,'Extrema','Centroid');

se = strel('disk',10);
if num==1
    temp = round(bin(1).Extrema);
    temp(:,1) = temp(:,1) - min(temp(:,1)) + 1;
    temp(:,2) = temp(:,2) - min(temp(:,2)) + 1;
    mask = zeros(max(temp(:,1)),max(temp(:,2)));
    for cnt2 = 1:8
        mask(temp(cnt2,1),temp(cnt2,2))=1;
    end
    %imagesc(mask);
    mask2 = imdilate(mask,se);
    %imagesc(mask2);
    
    imshow(mask2);
    
    [labeled,numObjects] = bwlabel(mask2,8);
   % disp(numObjects);
    %disp(temp);
    if numObjects==4
        shape=diffSqnCir(mask);
    else
        shape=numObjects;
    end
    
else
shape=0;
end



end