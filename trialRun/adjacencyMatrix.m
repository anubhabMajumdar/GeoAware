function [am]=adjacencyMatrix(Nodes,img)

numNodes=numel(Nodes)/2;

adj_matrix = zeros(numNodes,numNodes);

for i=1:numNodes
    %disp(Nodes(i,2));
    current_node = [Nodes(i,1),Nodes(i,2)];
    
    for j=1:numNodes
        
        check_node = [Nodes(j,1),Nodes(j,2)];
        
        adj_matrix(i,j)=0;
        
        if current_node~=check_node
            is_path=1;
            
            if ((current_node(1)==check_node(1)) && (current_node(2)<check_node(2)))
                for k=current_node(2):check_node(2)
                    if img(current_node(1),k)==0
                        is_path=0;
                        break;
                    end
                end
                adj_matrix(i,j)=is_path;
            end
            
        else if ((current_node(1)==check_node(1)) && (current_node(2)>check_node(2)))
                for k=check_node(2):current_node(2)
                    if img(current_node(1),k)==0
                        is_path=0;
                        break;
                    end
                end
                adj_matrix(i,j)=is_path;
            
            
        else if ((current_node(2)==check_node(2)) && (current_node(1)>check_node(1)))
                for k=check_node(1):current_node(1)
                    if img(k,current_node(2))==0
                        is_path=0;
                        break;
                    end
                end    
                adj_matrix(i,j)=is_path;
             
        else if ((current_node(2)==check_node(2)) && (current_node(1)<check_node(1)))
                for k=current_node(1):check_node(1)
                    if img(k,current_node(2))==0
                        is_path=0;
                        break;
                    end
                end
                adj_matrix(i,j)=is_path;
            
            end
            end
            end
        end
    end
end
disp(adj_matrix);
end
