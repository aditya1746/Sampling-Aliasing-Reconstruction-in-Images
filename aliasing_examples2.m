clc; clear all; close all;

%=========== Reading the input

%for house image
%Z = imread('house.png');
%Z = rgb2gray(Z);

%for zoneplate
Z = imzoneplate(501);

figure;
imshow(Z)
title('Z')

% ===============SAMPLING====== Resizing the image, 

Z2 = Z(1:2:end,1:2:end);
figure;
imshow(Z2)
title('Z2')

Z4 = Z(1:4:end,1:4:end);
figure;
imshow(Z4)
title('Z4')

Z8 = Z(1:8:end,1:8:end);
figure;
imshow(Z8)
title('Z8')

% finding Fourier transform of 'Z'

cim=double(Z);
[r,c]=size(cim);

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
subplot(1,3,1);imshow(cim);
subplot(1,3,2);imshow(pim);
subplot(1,3,3);imshow(kim);

%2D fft
fim=fft2(kim);

figure;
subplot(2,2,1);imshow(Z);title('Original image');
subplot(2,2,2);imshow(uint8(fim));title('Transform');

% Lowpass filtering before sampling

n=1; %order for butterworth filter
thresh=40; % cutoff radius in frequency domain for filters

% ****** NOTE ***  Thresh = 40 for imzoneplate and 90 for house

% % function call for low pass filters
him=glp(fim,thresh); % gaussian low pass filter
% him=blpf(fim,thresh,n); % butterworth low pass filter


% =========== RECONSTRUCTION ========== finding inverse 2D fft
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

%for imzone plate
rim=real(rim);

%for house image
%rim=uint8(rim);

figure, imshow(rim);
title('reconstructed image')

figure;
subplot(2,3,1);imshow(Z2);title('Original image');
subplot(2,3,2);imshow(kim);title('Padded image');
subplot(2,3,3);imshow(fim);title('Fourier Transform');
subplot(2,3,4);imshow(him);title('Low pass filtered Fourier Transform');
subplot(2,3,5);imshow(ifim);title('Inverse fourier transform');
subplot(2,3,6);imshow(rim);title('reconstructed image');

Z4_lpf = rim(1:4:end,1:4:end);
figure;
imshow(Z4_lpf)
title('Z4 lpf')