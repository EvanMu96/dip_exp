clc
clear 
close all
%% priwitt operator
I = imread('lena.bmp');
[h, w] = size(I);
subplot(3,3,2);
imshow(I);
title('original image');
matx = (1/3)*[+1 0 -1;+1 0 -1;+1 0 -1];
maty = matx';
vecx = double(reshape(matx, [1,9]));
vecy = double(reshape(maty, [1,9]));
I = im2double(I);
IedgeX = zeros(h, w);
IedgeY = IedgeX;
for i=2:h-1
    for j=2:w-1
        tempA = reshape(I(i-1:i+1,j-1:j+1),[1,9]);
        IedgeX(i,j) = dot(tempA,vecx);
    end
end
for i=2:h-1
    for j=2:w-1
        tempA = reshape(I(i-1:i+1,j-1:j+1),[1,9]);
        IedgeY(i,j) = dot(tempA,vecy);
    end
end
subplot(3,3,4);
priwittEdge = IedgeX+IedgeY;
imshow(abs(priwittEdge));
title('priwitt operator');
subplot(3,3,5);
imshow(abs(IedgeX));
title('edge on x')
subplot(3,3,6);
imshow(abs(IedgeY));
title('edge on y'); 

%% sobel operator
matx = (1/3)*[+1 0 -1;+2 0 -2;+1 0 -1];
maty = matx';
vecx = double(reshape(matx, [1,9]));
vecy = double(reshape(maty, [1,9]));
for i=2:h-1
    for j=2:w-1
        tempA = reshape(I(i-1:i+1,j-1:j+1),[1,9]);
        IedgeX(i,j) = dot(tempA,vecx);
    end
end
for i=2:h-1
    for j=2:w-1
        tempA = reshape(I(i-1:i+1,j-1:j+1),[1,9]);
        IedgeY(i,j) = dot(tempA,vecy);
    end
end
sobelEdge = IedgeX+IedgeY;
subplot(3,3,7);
imshow(abs(sobelEdge));
title('sobel operator');
subplot(3,3,8);
imshow(abs(IedgeX));
title('edge on x')
subplot(3,3,9);
imshow(abs(IedgeY));
title('edge on y');