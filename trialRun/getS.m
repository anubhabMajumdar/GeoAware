function i=getS(sr,sc,Nodes,im)
len=numel(Nodes)/2;
disp(sr);
disp(sc);
for i=1:len
    r=Nodes(i,1);
    c=Nodes(i,2);
    
    if im(r,c,1)>200 && im(r,c,1)<256 && im(r,c,2)>200 && im(r,c,2)<255 && im(r,c,3)>=0 && im(r,c,3)<50
       
        break;
    end
end
        
end