function [ardR]=ardRoute(dir)
l=numel(dir);
count=1;
for i=1:l
    if dir(i)=='L'
        ard(count)='1';
    end
    if dir(i)=='R'
        ard(count)='0';
    end
    count=count+1;
   
    ard(count)=',';
    count=count+1;
    
end
len=numel(ard);
for i=1:len-1
    ardR(i)=ard(i);
end
end