close all;
clear all;
lena = imread('lena.bmp');

figure;
% settin for rotation angle
rotationAngle = pi/6;
% preliminary rotation matix
transMatrix = [cos(rotationAngle) sin(rotationAngle) 0; -sin(rotationAngle) cos(rotationAngle) 0; 0 0 1];
[height ,width] = size(lena);
% computed by origin size and rotation angle
newsize = ceil([height*(sin(rotationAngle) + cos(rotationAngle)) width*(sin(rotationAngle) + cos(rotationAngle))]);
% initialize new picture
newPic = uint8(zeros(newsize(1), newsize(2)));
% traverse new picture and get value from original one
for i=1: newsize(1)
    for j=1:newsize(2)
        oldLocation= floor(([i j 1]*inv(transMatrix)));
        % translation new position to old position
        % todo:fix hardcode to changeable,
        oldLocation(1) = oldLocation(1)-220;
        oldLocation(2) = oldLocation(2)+124;
        % drop the points out of boundary
        if (oldLocation(1)<=0 ) || (oldLocation(2)<=0) || (oldLocation(1)>=height ) || (oldLocation(2)>=width)
            continue
        end
        newPic(i,j) = lena(oldLocation(1),oldLocation(2));
    end
end
imshow(newPic);
 
imwrite(newPic, 'rotated_lena.bmp');
% show new picture's info
imfinfo('rotated_lena.bmp')       
        
        