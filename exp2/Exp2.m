%Evan Mu's exp2 Code 2017
%close all figure from last expriment
close all;

%read data from file
tpa = imread('tpa.bmp');
tpb = imread('tpb.bmp');
fprintf('Image read success!\n')

%plot some logic operations between two binary-image
subplot(2,3,1);
imshow(tpa);
title('Binary image A');
subplot(2,3,2)
imshow(tpb);
title('Binary image B');
subplot(2,3,3)
imshow(tpa & tpb);
title('A & B');
subplot(2,3,4);
imshow(tpa | tpb);
title('A | B');
subplot(2,3,5);
imshow(not(tpa) & tpb);
title('(not A) and B');
subplot(2,3,6);
imshow(tpa | not(tpb));
title('A or (not B)');
fprintf('All image have plotted at figure1\n')

figure;
%read a gray-scale bmp file
lena = imread('lena.bmp');
fprintf('read lena.bmp successfully\n')
%get the size of new picture
lenasize = size(lena);


%create two tempelates for logic operations
templateA = uint8(tpa);
templateB = uint8(not(tpa));

%plot some operations between gray-scale image and window template 
subplot(2,3,1);
imshow(lena);
title('lena.bmp origin picture');
subplot(2,3,2);
imshow(tpa);
title('templateA');
subplot(2,3,3);
imshow((tpa));
title('templateB');
subplot(2,3,4);
imshow(templateA .* lena);
title('templateA and lena.bmp');
subplot(2,3,5);
imshow(templateB .* lena);
title('templateB and lena.bmp');

figure;

tiger = imread('tiger.bmp');
tigertpa = ones(256,256);
tigertpa(64:182,64:182) = 0;

%using 2 dimensional window template to create 3 dimensional window template
for i = 1:3
    tiger_m_tpa(:,:,i) = tiger(:,:,i) .* uint8(tigertpa);
    tiger_m_tpb(:,:,i) = tiger(:,:,i) .* uint8(not(tigertpa));
end
  
%plot some operations between true-color image and window template
subplot(2,3,1);
imshow(tiger);
title('tiger.bmp origin picture');
subplot(2,3,2);
imshow(tigertpa);
title('templateA');
subplot(2,3,3);
imshow(not(tigertpa));
title('templateB');
subplot(2,3,4);
imshow(tiger_m_tpa);
title('templateA and tiger.bmp');
subplot(2,3,5);
imshow(tiger_m_tpb);
title('templateB and tiger.bmp');



