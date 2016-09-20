function [cp]=color_path(bwpath,cpath)
[r,c,t]=size(cpath);
imshow(cpath);
%cp=zeros(r,c,3);

 for i=1:r
     for j=1:c
        if bwpath(i,j)==1
            cp(i,j,1)=255;
            cp(i,j,2)=255;
            cp(i,j,3)=255;
        else
              cp(i,j,1)=0;
              cp(i,j,2)=0;
              cp(i,j,3)=0;
         end
     end
 end
figure,imshow(cp);
for i=1:r
    for j=1:c
          if bwpath(i,j)==1 && ~( ( cpath(i,j,1)==0 && cpath(i,j,2)==0 && cpath(i,j,3)==0 ) && ( cpath(i,j,1)==255 && cpath(i,j,2)==255 && cpath(i,j,3)==255 ) )
              cp(i,j,1)=cpath(i,j,1);
              cp(i,j,2)=cpath(i,j,2);
              cp(i,j,3)=cpath(i,j,3);
          end
    end
end
figure,imshow(cp);
end