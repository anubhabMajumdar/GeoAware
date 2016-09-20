function [stat]=extractCentroid(bin)
[bin,num]=bwlabel(bin);
stat = regionprops(bin,'centroid');
for x=1:numel(stat)
    stat(x).Centroid(1)=round(stat(x).Centroid(1));
    stat(x).Centroid(2)=round(stat(x).Centroid(2));
end
end