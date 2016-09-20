function [sr,sc]=EndPoint(stat,im)
sr=0;
sc=0;
for i=1:numel(stat)
    r=stat(i).Centroid(2);
    c=stat(i).Centroid(1);
   if im(r,c,1)>150 && im(r,c,1)<200 && im(r,c,2)>100 && im(r,c,2)<200 && im(r,c,3)>50 && im(r,c,3)<100
        sr=r;
        sc=c;
        break;
    end
end