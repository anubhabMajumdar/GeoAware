function dir=getDir(p)
l=numel(p);
count=1;
for i=1:l-1
   str(1)=p(i);
   str(2)=p(i+1);
  
   switch str
       case 'NE'
           dir(count)='R';
       case 'NW'
           dir(count)='L';
       case 'SE'
           dir(count)='L';
       case 'SW'
           dir(count)='R';
       case 'EN'
           dir(count)='L';
       case 'ES'
           dir(count)='R';
       case 'WN'
           dir(count)='R';
       case 'WS'
           dir(count)='L';
       otherwise dir(count)='S';
           
   end
   count=count+1;
end