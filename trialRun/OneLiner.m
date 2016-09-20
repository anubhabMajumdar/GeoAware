function [bin]=OneLiner(bin,w)

[r,c]=size(bin);
past=0;
first=0;
thresh=round(w/2);
%thresh=w;
for j=1:c
    if ((first==0) && (bin(1,j)==1))
        past=j;
        first=1;
        
    else if (bin(1,j)==1)
           
        if (j-past)<thresh
            
            for row=1:r
                if bin(row,j-1)==1 && bin(row,j+1)==1
                    bin(row,j)=1;
                else bin(row,j)=0;
                end
            end
            
        end
        past=j;
        end
    end
end

%figure,imshow(bin);
first=0;
for i=1:r
    if ((first==0) && (bin(i,1)==1))
        past=i;
        first=1;
        
    else if (bin(i,1)==1)
           
        if (i-past)<thresh
            
            for col=1:c
                if bin(i-1,col)==1 && bin(i+1,col)==1
                    bin(i,col)=1;
                else bin(i,col)=0;
                end
            end
            
        end
        past=i;
        end
    end
end


%figure,imshow(bin);


        
end
   