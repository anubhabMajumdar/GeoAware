function[w]=width(im)
[r,c,t]=size(im);
brown=zeros(r,c);
for i=1:r
    for j=1:c
        if im(i,j,1)>150 && im(i,j,1)<200 && im(i,j,2)>100 && im(i,j,2)<200 && im(i,j,3)>50 && im(i,j,3)<100
            brown(i,j)=1;
        end
    end
end

%figure,imshow(brown);
%[l,num]=bwlabel(brown);
flag=0;
for i=1:r
    for j=1:c
        if brown(i,j)==1
            row=i;
            col=j;
            flag=1;
            break;
        end
    end
    if flag==1
        break;
    end
end
% disp(row);
% disp(col);
colCount=0;
rowCount=0;
for i=row:r
    if brown(i,col)==1
        rowCount=rowCount+1;
    end
end

for j=col:c
    if brown(row,j)==1
        colCount=colCount+1;
    end
end
% disp(rowCount);
% disp(colCount);
if rowCount>colCount
    w=rowCount;
else w=colCount;
end

end

    
    