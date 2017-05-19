clear
clc
close all

%% Load Image
I = imread('lena.bmp');
%% Get height and width of image
[h, w] = size(I);
%% Convert uint8 to double
R = double(I);
%% Define iteration time n
%Default iteration time is 1
n = 3;
%% Start iteration
for i = 1:n
    %for each row
    R(1:w, 1:h) = [R(1:w, 1:2:h)+R(1:w ,2:2:h) R(1:w, 1:2:h)-R(1:w,2:2:h)];
    %for each column
    R(1:w, 1:h) = [R(1:2:w, 1:h)+R(2:2:w, 1:h);  R(1:2:w, 1:h)-R(2:2:w, 1:h)];
    %next w,h
    w = w/2;
    h = h/2;
end
%% Plot image
subplot(1,3,1)
imshow(R,[]);
title([n, ' step dwt']);

%% Threshold filtering
R(R<30) = 0;

%% Reconstruction
[h, w] = size(R);

h = h/(2^(n-1));
w = w/(2^(n-1));
for i = 1:n
    %Reconstruction each row
    Zp = R(1:h/2, 1:w);
    Zn = R(h/2+1:h, 1:w);

    x = (Zp+Zn)/2;
    y = (Zp-Zn)/2;

    R(1:2:h, 1:w) = x;
    R(2:2:h, 1:w) = y;
    %Reconstruct each column
    Zp = R(1:h, 1:w/2);
    Zn = R(1:h,w/2+1:w);

    x = (Zp+Zn)/2;
    y = (Zp-Zn)/2;

    R(1:h, 1:2:w) = x;
    R(1:h, 2:2:w) = y;
    
    %next h,w
    h = h*2;
    w = w*2;
    
end
%% Plot the reconstructed image
subplot(1,3,2);
imshow(R, []);
title([n, ' step idwt']);
subplot(1,3,3);
imshow(I);
title('original image');