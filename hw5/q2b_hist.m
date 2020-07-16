clear;
load('berkeley_horses.mat');
img = double(imread("Berkeley_horses.jpg"));
seg = groundTruth{1,1}.Segmentation;
back = (seg==1);
at1 = (seg==2);
at2 = (seg==3);

RGBat1(:,:,1) = img(:,:,1).*at1;
RGBat1(:,:,2) = img(:,:,2).*at1;
RGBat1(:,:,3) = img(:,:,3).*at1;

RGBat2(:,:,1) = img(:,:,1).*at2;
RGBat2(:,:,2) = img(:,:,2).*at2;
RGBat2(:,:,3) = img(:,:,3).*at2;

RGBback(:,:,1) = img(:,:,1).*back;
RGBback(:,:,2) = img(:,:,2).*back;
RGBback(:,:,3) = img(:,:,3).*back;

figure;
subplot(4,3,1);
imshow(uint8(RGBback));
subplot(4,3,2);
imshow(uint8(RGBat1));
subplot(4,3,3);
imshow(uint8(RGBat2));

subplot(4,3,4);
imhist(uint8(RGBback(:,:,1)));
subplot(4,3,7);
imhist(uint8(RGBback(:,:,2)));
subplot(4,3,10);
imhist(uint8(RGBback(:,:,3)));

subplot(4,3,5);
imhist(uint8(RGBat1(:,:,1)));
subplot(4,3,8);
imhist(uint8(RGBat1(:,:,2)));
subplot(4,3,11);
imhist(uint8(RGBat1(:,:,3)));

subplot(4,3,6);
imhist(uint8(RGBat2(:,:,1)));
subplot(4,3,9);
imhist(uint8(RGBat2(:,:,2)));
subplot(4,3,12);
imhist(uint8(RGBat2(:,:,3)));