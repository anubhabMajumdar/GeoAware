function [im]=centroidLine(bin,stat)
[r,c]=size(bin);
im=zeros(r,c);
cent=cat(1,stat.Centroid);

for i=1:numel(stat)
   
        im=radiate(im,cent(i,2),cent(i,1));
  
end


end