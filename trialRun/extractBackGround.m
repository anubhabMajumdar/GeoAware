function[img]=extractBackGround(I)
[r,c,t]=size(I);
img=zeros(r,c);
for i=1:r
    for j=1:c
        if (I(i,j,1)==255 && I(i,j,2)==255 && I(i,j,3)==255 ) || (I(i,j,1)==0 && I(i,j,2)==0 && I(i,j,3)==0)
        else img(i,j)=1;
        end
    end
end

end