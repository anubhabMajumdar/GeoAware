function [c]=whiteAll(sr,sc,dr,dc,img)
flag=0;
if sr<dr
    if sc<dc
        for i=sr:dr
            for j=sc:dc
                if img(i,j)==1
                    c=1;
                else
                    c=0;
                    flag=1;
                    break;
                end
                if flag==1
                    break;
                end
            end
        end
    else
        for i=sr:dr
            for j=dc:sc
                if img(i,j)==1
                    c=1;
                else flag=1;
                    c=0;
                    break;
                end
                if flag==1
                    break;
                end
            end
        end
    end
else 
    if sc>dc
        for i=dr:sr
            for j=dc:sc
                if img(i,j)==1
                    c=1;
                else flag=1;
                    c=0;
                    break;
                end
                if flag==1
                    break;
                end
            end
        end
    else
        for i=dr:sr
            for j=sc:dc
                if img(i,j)==1
                    c=1;
                else flag=1;
                    c=0;
                    break;
                end
                if flag==1
                    break;
                end
            end
        end
    end
end
                
                
end