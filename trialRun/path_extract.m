function [im]= path_extract(im,im_c)
[r,c,t]=size(im_c);
image=zeros(r,c);
for i=1:r
    for j=1:c
        image(i,j)=1;
    end
end
for i=1:r
    for j=1:c
        if im(i,j)==1 && im_c(i,j,1)==0 && im_c(i,j,2)==0 && im_c(i,j,3)==0
            %image(i,j)=0;
            im(i,j)=0;
        end
    end
end

for i=1:r
    for j=1:c
        if im(i,j)==0
            else im(i,j)=1;
        end
    end
end
end
