close all;
clear all;
lena = imread('tiger.bmp');

figure;
% settin for rotation angle
rotationAngle = pi/6;
% preliminary rotation matix
transMatrix = [cos(rotationAngle) sin(rotationAngle) 0; -sin(rotationAngle) cos(rotationAngle) 0; 0 0 1];
[height ,width, dmsize] = size(lena);
% computed by origin size and rotation angle
newsize = ceil([height*(sin(rotationAngle) + cos(rotationAngle)) width*(sin(rotationAngle) + cos(rotationAngle))]);
% initialize new picture
newPicD = uint8(zeros(newsize(1), newsize(2)));
newPic(:,:,1) = newPicD;
newPic(:,:,2) = newPicD;
newPic(:,:,3) = newPicD;
% traverse new picture and get value from original one
figure;
imshow(newPic)
for dm=1:dmsize
    for i=1: newsize(1)
        for j=1:newsize(2)
            oldLocation= floor(([i j 1]*inv(transMatrix)));
            % translation nesw position to old position
            % todo:fix hardcode to changeable,
            oldLocation(1) = oldLocation(1)-110;
            oldLocation(2) = oldLocation(2)+62;
            % drop the points out of boundary
            if (oldLocation(1)<=0 ) || (oldLocation(2)<=0) || (oldLocation(1)>=height ) || (oldLocation(2)>=width)
                continue
            end
            newPic(i,j,dm) = lena(oldLocation(1),oldLocation(2),dm);
        end
    end
end
imshow(newPic);
 
imwrite(newPic, 'rotated_tiger.bmp');
% show new picture's info
imfinfo('rotated_tiger.bmp')       
        
        