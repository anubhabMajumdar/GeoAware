function [bb,col,new_img,cent] = color_detect(f)

    col = 'r';
    gray = rgb2gray(f);
    
    r =f(:,:,1)-gray;
    g = f(:,:,2)-gray;
    b = f(:,:,3)-gray;
    
    %%
    
%     figure,imshow(r);
%     figure,imshow(g);
%     figure,imshow(b);
%     
    %% Checking r|g|b
    
    [row col] = size(r);
    
    thresh_r = (max(max(r))+min(min(r)))/2;
    thresh_g = (max(max(g))+min(min(g)))/2;
    thresh_b = (max(max(b))+min(min(b)))/2;
    
     x_r = zeros(row,col);
     x_g = zeros(row,col);
     x_b = zeros(row,col);
     x = zeros(row,col);
     
%%
     for i=1:row
         for j=1:col
             if r(i,j)>=thresh_r
                 x_r(i,j)=1;
             end
             if g(i,j)>=thresh_g
                 x_g(i,j)=1;
             end
             if b(i,j)>=thresh_b
                 x_b(i,j)=1;
             end
         end
     end
 
%%
%        figure,imshow(x_r);
%        figure,imshow(x_g);
%        figure,imshow(x_b);
% %      
%%
area_r = bwarea(x_r);
area_g = bwarea(x_g);
area_b = bwarea(x_b);

p = round(0.6*area_r);
x_r = bwareaopen(x_r,p);

p = round(0.6*area_g);
x_g = bwareaopen(x_g,p);

p = round(0.6*area_b);
x_b = bwareaopen(x_b,p);

area_r = bwarea(x_r);
area_g = bwarea(x_g);
area_b = bwarea(x_b);

%%
m = max([area_r, area_g, area_b]);

if m==area_r
    area = area_r;
    x = x_r;
    col = 'r';
    %disp('red');
else if m == area_g
        area = area_g;
        x = x_g;
        col = 'g';
        %disp('green');
    else if m == area_b
        area = area_b;
        x = x_b;
        col = 'b';
        %disp('blue');
        end
    end
end


%%

p = round(0.6*area);
new_img = bwareaopen(x,p);
new_img = imfill(new_img,'holes');

%figure,imshow(new_img);

s = regionprops(new_img,'BoundingBox','Extrema','Centroid');

bb = round(s.BoundingBox);
ex = round(s.Extrema);
cent = round(s.Centroid);
%[row,col]
%figure,imshow(f(ex(1,2):ex(1,2)+bb(1,4),ex(8,1):ex(8,1)+bb(1,3),:));


end
