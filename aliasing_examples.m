clc; clear all; close all;

% ============= reading the image

%for bricks
%img = imread('original_bricks.jpg');
%img = rgb2gray(img);

%for A
img = imread('A.png');

figure;
imshow(img)

% ***** NOTE ****** A.png is already a grayscale image while
% original_bricks.jpg isnt *********************************

% ================= resizing the image, equivalent to sampling

%half = imresize(img,[640,480]);
half = imresize(img,0.5);
figure;
imshow(half);

% finding Fourier transform of 'img'

cim=double(img);
[r,c]=size(cim)
r1=2*r;
c1=2*c;

pim=zeros((r1),(c1));
kim=zeros((r1),(c1));

%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end

%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end

figure; 
subplot(1,3,1); imshow(cim);
subplot(1,3,2); imshow(pim);
subplot(1,3,3); imshow(kim);

fim=fft2(kim);

figure;
subplot(2,2,1);imshow(img);title('Original image');
subplot(2,2,2);imshow(uint8(fim));title('Transform');


%=================== Low Pass Filtering

n=1;        %order for butterworth filter
thresh=100; % cutoff radius in frequency domain for filters

% ****** keep thresh = 120 for bricks moire pattern example and thresh =
% ****** 100 for letter A (jaggies) example. ****************************

% =============== function call for low pass filters

 him=glp(fim,thresh);       % gaussian low pass filter
% him=blpf(fim,thresh,n);   % butterworth low pass filter


% ================= RECONSTRUCTION ===================

% ======== finding inverse Fourier Transform ==========

ifim=ifft2(him);
 
for i=1:r1
    for j=1:c1
   ifim(i,j)=ifim(i,j)*((-1)^(i+j));
    end
end


% removing the padding
for i=1:r
    for j=1:c
   rim(i,j)=ifim(i,j);
    end
end

% retaining the ral parts of the matrix
%rim=real(rim);
rim=uint8(rim);

figure, imshow(rim);
title ('reconstructed image')

figure;
subplot(2,3,1);imshow(img);title('Original image');
subplot(2,3,2);imshow(kim);title('Padded Image');
subplot(2,3,3);imshow(fim);title('Fourier Transform');
subplot(2,3,4);imshow(him);title('Low pass filtered Fourier Transform');
subplot(2,3,5);imshow(ifim);title('Inverse fourier transform');
subplot(2,3,6);imshow(rim);title('Reconstructed image');

% ========== resizing the image obtained after removing high frequencies

%this one for A.png
anti_aliased = imresize(rim,0.5);

%this one for bricks img
%anti_aliased = imresize(rim,[640,480]);  

figure;
imshow(anti_aliased)
title('anti_aliased')