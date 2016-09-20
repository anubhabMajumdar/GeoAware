function [] = allign_bot()%arduino)

imaqreset;

blank_count=0;

vid = videoinput('winvideo', 1, 'YUY2_320x240');
vid.FramesPerTrigger = inf;
vid.FrameGrabInterval = 1;
set(vid, 'ReturnedColorSpace', 'RGB');

start(vid);
preview(vid);

choice = false;

thresh = 10;

while (choice==false)
    
    try
     img = getsnapshot(vid);
%     
%     bw = imfill(im2bw(img),'holes');
%     s = regionprops(bw ,'Centroid');
%     
     
%     cent = s.Centroid;
    
    [bb,col,bw,cent] = color_detect(img);
    
    [r,c] = size(bw);
    
    area = r*c;
    p = round(0.4*area);
    bw = bwareaopen(bw,p);

    img_center = [round(r/2),round(c/2)];
    imshow(bw);
    
    if ((cent(1)>=img_center(2)-thresh) && (cent(1)<=img_center(2)+thresh))
        disp('alligned');
        choice=true;
        
    else
        if cent(1)>img_center(2)+thresh
            disp('right');
            fprintf(arduino,'%d',5);    %5-->right
        else if cent(1)<img_center(2)-thresh 
            disp('left');
            fprintf(arduino,'%d',4);    %4-->left
            end
        end
    end
    catch
        if blank_count==0
            disp('blank left');
            fprintf(arduino,'%d',4);    %4-->left
            blank_count=blank_count+1;
        end
        if blank_count==1
                disp('blank right');
                fprintf(arduino,'%d',5);    %5-->right
                blank_count=blank_count+1;
        end
        if blank_count==3
               disp('blank right');
               fprintf(arduino,'%d',5);    %5-->right
               blank_count=blank_count+1;
        end
        
        if blank_count==4
               disp('blank left');
               fprintf(arduino,'%d',4);    %4-->left
               blank_count=blank_count+1;
        end
        if blank_count==5
               disp('blank');
               return;
        end
        
    end
end

stoppreview(vid);
stop(vid);
run;

end

    