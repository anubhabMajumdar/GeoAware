function i=getDest(er,ec,Nodes,im)
len=numel(Nodes)/2;
disp(er);
disp(ec);
for i=1:len
    r=Nodes(i,1);
    c=Nodes(i,2);
    if im(r,c,1)>150 && im(r,c,1)<200 && im(r,c,2)>100 && im(r,c,2)<200 && im(r,c,3)>50 && im(r,c,3)<100
        break;
    end
end
end