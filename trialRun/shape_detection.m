function [shape] = shape_detection(img)

s = regionprops(img,'BoundingBox','Extrema','Centroid','Area');

bb = round(s.BoundingBox);
ex = round(s.Extrema);
cent = round(s.Centroid);
area = round(s.Area);

bb_area = bb(3) * bb(4);

ratio = area/bb_area;

if ratio>0.2 && ratio<0.5
    shape=3;
    disp('Triangle');
else if ratio>0.6 && ratio <0.85
        shape=6;
        disp(shape);
        disp('circle');
    else if ratio>0.9 && ratio < 1.0
            shape=4;
            disp('Square');
        else shape=0;
            disp('Unknown');
        end
    end
end

end




                                                                