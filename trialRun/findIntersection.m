function [intersections]=findIntersection(im)
[r,c]=size(im);
a=1;
for i=2:r-1
    for j=2:c-1
        if im(i-1,j)==1 && im(i+1,j)==1 && im(i,j-1)==1 && im(i,j+1)==1
            intersections(a,1)=i;
            intersections(a,2)=j;
            a=a+1;
        end
    end
end
end