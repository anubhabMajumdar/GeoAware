function [e,w,n,s]=intersection(im,i,j)

[r,c]=size(im);
e=0;
w=0;
n=0;
s=0;
for q=j:c
    if im(i,q)==1
        e=e+1;
    else break;
    end
end

for q=j:-1:1
    if im(i,q)==1
        w=w+1;
    else break;
    end
end

for q=i:r
    if im(q,j)==1
        s=s+1;
    else break;
    end
end


for q=i:-1:1
    if im(q,j)==1
        n=n+1;
    else break;
    end
end



end