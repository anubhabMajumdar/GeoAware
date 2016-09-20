function [im]=subtract(im,width)

[r,c]=size(im);

for i=2:r-1
    for j=2:c-1
        if im(i-1,j)==1 && im(i+1,j)==1 && im(i,j-1)==1 && im(i,j+1)==1
           [e,w,n,s]=intersection(im,i,j);
           if e<width
               im(i,j+1:j+e)=0;
           end
           if w<width
               im(i,j-w+1:j-1)=0;
           end
           if n<width
               im(i-n+1:i-1,j)=0;
           end
           if s<width
               im(i+1:i+s,j)=0;
           end
            
        end
    end
end


end