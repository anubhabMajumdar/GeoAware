function im = radiate(im,row,col)
[r,c]=size(im);
for i=1:r
    im(i,col)=1;
end
for j=1:c
    im(row,j)=1;
end
end