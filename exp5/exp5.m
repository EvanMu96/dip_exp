clear 
close all
clc
I=imread('lena.bmp');
[h, w] = size(I);
subplot(1,4,1);
imshow(I)
title('original image');
nI=imnoise(I,'salt & pepper',0.07);%adding salt & pepper noise
k1 = nI;
k2 = nI;
subplot(1,4,2);
imshow(nI);
title('plus noise')
for i=2:h-1
    for j=2:w-1
        temp = sort(reshape(nI(i-1:i+1,j-1:j+1),[1,9]));
        k1(i,j) = temp(5);
    end
end
subplot(1,4,3);
imshow(k1);
title('median filter')
for i=2:h-1
    for j=2:w-1
        k2(i,j) = (1/9)*sum(reshape(nI(i-1:i+1,j-1:j+1),[1,9]));
    end
end
subplot(1,4,4);
imshow(k2);
title('average mean filter')