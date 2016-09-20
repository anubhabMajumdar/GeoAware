function [am]=AM1(Nodes,img)
[r,c]=size(img);
am=zeros(numel(Nodes)/2,numel(Nodes)/2);
for i=1:numel(Nodes)/2
    for j=1:numel(Nodes)/2
        if whiteAll(Nodes(i,1),Nodes(i,2),Nodes(j,1),Nodes(j,2),img)
           %if 
           %else 
            am(i,j)=1;
           %end
        end
    end
    
end

end