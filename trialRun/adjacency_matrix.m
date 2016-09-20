function [adj_matrix] = adjacency_matrix(nodes,img)

[nx , ny] = size(nodes);
[r , c] = size(img);

adj_matrix = zeros(nx,nx);

for i=1:nx
    current = [nodes(i,1),nodes(i,2)];
    
    for j=1:nx
        
        is_path=1;
        check = [nodes(j,1),nodes(j,2)];
        
        north = c;
        south = c;
        east = r;
        west = r;
        
        if j~=i
            % horizontal check
            
            if ((current(1)==check(1)) && (current(2)<check(2)))
                
                for k=current(2):check(2)
                    if img(current(1),k)==0
                        is_path=0;
                    end
                end
                
                if ((is_path==1) && (east > check(2)-current(2)))
                    east = check(2)-current(2);
                end
                
                adj_matrix(i,j) = is_path;
            
            else if ((current(1)==check(1)) && (current(2)>check(2)))
                
                for k=check(2):current(2)
                    if img(current(1),k)==0
                        is_path=0;
                    end
                end
                
                if ((is_path==1) && (west > current(2)-check(2)))
                    west = current(2)-check(2);
                end
                
                adj_matrix(i,j) = is_path;
            
                end
            end
            % vertical check
            
            if ((current(2)==check(2)) && (current(1)<check(1)))
                
                for k=current(1):check(1)
                    if img(k,current(2))==0
                        is_path=0;
                    end
                end
                
                if ((is_path==1) && (south > check(1)-current(1)))
                    east = check(1)-current(1);
                end
                
                adj_matrix(i,j) = is_path;
            
            else if ((current(2)==check(2)) && (current(1)>check(1)))
                
                for k=check(1):current(1)
                    if img(k,current(2))==0
                        is_path=0;
                    end
                end
                
                if ((is_path==1) && (north > current(1)-check(1)))
                    west = current(1)-check(1);
                end
                
                adj_matrix(i,j) = is_path;
            
                end
            end
            
        end
    end
end
%
% res =adj_matrix;
% 
% f = fopen('output.txt','w');
% fprintf(f,'%d\r\n',nx);
% for i=1:nx
%     for j=1:nx
%         fprintf(f,'%d ',res(i,j));
%     end
%         fprintf(f,'\r\n');
% end
% 
% system('python dijkstra.py output.txt');
% 
% %%
% pic=zeros(r,c);
% 
% for i=1:nx
%     for j=1:nx
%        if (res(i,j)==1)
%            pic(nodes(i,1):nodes(j,1),nodes(i,2):nodes(j,2))=1;
%        end
%     end
% end
% imshow(pic);
end

                
                
                
                
                
            
            
            
            
            


