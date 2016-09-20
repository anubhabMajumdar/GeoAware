function [sr,sc]=StartPoint(stat,im)
sr=0;
sc=0;
for i=1:numel(stat)
    r=stat(i).Centroid(2);
    c=stat(i).Centroid(1);
   if im(r,c,1)>200 && im(r,c,1)<256 && im(r,c,2)>200 && im(r,c,2)<255 && im(r,c,3)>=0 && im(r,c,3)<50
        sr=r;
        sc=c;
        break;
    end
end


end