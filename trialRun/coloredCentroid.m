function [I]=coloredCentroid(cent,I)
[r,c,t]=size(I);
I=zeros(r,c,t);
for i=1:numel(cent)
    R(i)=( I ( cent(i).Centroid(2)  , cent(i).Centroid(1) ,1 ) );
    G(i)=( I ( cent(i).Centroid(2)  , cent(i).Centroid(1) ,2 ) );
    B(i)=( I ( cent(i).Centroid(2)  , cent(i).Centroid(1) ,3 ) );
    I( cent(i).Centroid(2)  , cent(i).Centroid(1) ,1 )=R(i);
     I( cent(i).Centroid(2)  , cent(i).Centroid(1) ,2 )=G(i);
      I( cent(i).Centroid(2)  , cent(i).Centroid(1) ,3 )=B(i);
    
end
imshow(I);

end