function [direction]=go(I)
%figure,imshow(I);

%bin=extractBackGround(I); 
bin=extract(I);
%figure,imshow(bin);

w=width(I);
stat=extractCentroid(bin);
[sr,sc]=StartPoint(stat,I);
[er,ec]=EndPoint(stat,I);

% im=OneLiner1(bin,w);
cent=centroidLine(bin,stat);
%figure,imshow(cent);

im=OneLiner(cent,w);
%figure,imshow(im);

road=path_extract(im,I);
%figure,imshow(road);

Nodes=findIntersection(road);%returning in row col format
%a=AM1(Nodes,path);
imshow(road);
hold on;
for i=1:numel(Nodes)/2
    x=Nodes(i,2);
    y=Nodes(i,1);    
plot(x,y,'o','MarkerSize',10);
end
hold off;
am=adjacency_matrix(Nodes,road);
BGobj =biograph(am);
view(BGobj);

S=getS(sr,sc,Nodes,I);
T=getDest(er,ec,Nodes,I);

[dist, path, pred] = shortestpath(BGobj, S, T);
%disp(path);

highlightSP(BGobj,Nodes,path);

p=getRoute(Nodes,path);
disp(p);

direction=getDir(p);
disp(direction);
end
