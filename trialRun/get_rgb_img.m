function [col] = get_rgb_img() 
%try
    ret_val = 1;
    
    color = [];
    
    color('r') = 0;
    color('g') = 0;
    color('b') = 0;
    
%imaqreset;
    vid = videoinput('winvideo', 1, 'YUY2_320x240');
vid.FramesPerTrigger = inf;
vid.FrameGrabInterval = 1;
set(vid, 'ReturnedColorSpace', 'RGB');

start(vid);
c=0;
preview(vid);
while(vid.FramesAcquired<=10)
end

%while(vid.FramesAcquired<=1)
    try
    img = getsnapshot(vid);
    [bb,col,x,cent] = color_detect(img);
    
    color(col) = color(col)+1;
    
    %res = insertObjectAnnotation(img,'rectangle',bb,'OBJ','Color',col);
    imshow(x);
    hold on
    rect = rectangle('Position',bb);
    set(rect,'EdgeColor',col);
    hold off
     catch 
         disp('error');
     end
%end

stop(vid);

res = char(find(color==max(color)));
disp(res);
color('r')
color('g')
color('b')

shape=shape_detection(x)
% catch
%     disp('error');
%     ret_val = -1;
% end
end
