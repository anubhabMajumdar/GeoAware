function highlightSP(gObj,Nodes,path)

set(gObj.Nodes(path),'Color',[1 0.4 0.4])
edges = getedgesbynodeid(gObj,get(gObj.Nodes(path),'ID'));
set(edges,'LineColor',[1 0 0]);
set(edges,'LineWidth',1.5);
view(gObj);
end