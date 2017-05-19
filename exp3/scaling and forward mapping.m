close all;
clear all;
lena = imread('lena.bmp');
matrixSize = size(lena);
transVariable = [0.8 1.2];
for i=1: matrixSize(1)
    for j=1:matrixSize(2)
        newLocation = floor([i*transVariable(1)+1, j*transVariable(2)]+1);
        newPic(newLocation(1), newLocation(2)) = lena(i,j);
    end
end
imshow(newPic);
imwrite(newPic, 'scaling_lena.bmp');
imfinfo('scaling_lena.bmp')

figure;
rotationAngle = pi/6;
transMatrix = [cos(rotationAngle) sin(rotationAngle) 0; -sin(rotationAngle) cos(rotationAngle) 0; 0 0 1];
for i=1: matrixSize(1)
    for j=1:matrixSize(2)
        newLocation = floor(([i j 1]*transMatrix)+1);
        newPic2(newLocation(1)+256, newLocation(2)) = lena(i,j);
    end
end
 imshow(newPic2);
 size(newPic2);
 
imwrite(newPic2, 'rotated_lena.bmp');
imfinfo('rotated_lena.bmp')       
        
        
        