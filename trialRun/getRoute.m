function [p]= getRoute(Nodes,path)
%%
%upper-N
%down-S
%left-E
%right-W
%%

len=numel(path);
count=1;
%%
for i=2:len
    sr=Nodes(path(i-1),1);
    sc=Nodes(path(i-1),2);
    dr=Nodes(path(i),1);
    dc=Nodes(path(i),2);
    
    %%
    if sr==dr && sc~=dc
        if sc<dc
            p(count)='E';
        else 
            p(count)='W';
        end
    else 
        if sr<dr
            p(count)='S';
        else 
            p(count)='N';
        end
    end
    %disp(p(count));
    count=count+1;
    %%
    
end



end
