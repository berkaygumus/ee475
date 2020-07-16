kugu = imread('kugu.jpg');
beach = imread('beach.jpg');

figure;
subplot(2,4,5);
imshow(kugu);
title("original kugu image ");

subplot(2,4,1);
imshow(beach);
title("original beach image ");


rkugu = kugu(:,:,1);
gkugu = kugu(:,:,2);
bkugu = kugu(:,:,3);

rbeach = beach(:,:,1);
gbeach = beach(:,:,2);
bbeach = beach(:,:,3);

%%%%%%

eqrbeach = histeq(rbeach);
eqgbeach = histeq(gbeach);
eqbbeach = histeq(bbeach);

eqbeach(:,:,1) = eqrbeach;
eqbeach(:,:,2) = eqgbeach;
eqbeach(:,:,3) = eqbbeach;

subplot(2,4,2);
imshow(eqbeach);
title("RGB equalized beach image ");
%%%%%%
eqrkugu = histeq(rkugu);
eqgkugu = histeq(gkugu);
eqbkugu = histeq(bkugu);

eqkugu(:,:,1) = eqrkugu;
eqkugu(:,:,2) = eqgkugu;
eqkugu(:,:,3) = eqbkugu;

subplot(2,4,6);
imshow(eqkugu);
title("RGB equalized kugu image ");


%%%aaaaa
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%bbbbb

hsvbeach = rgb2hsv(beach);
vHSVbeach = hsvbeach;

vbeach = hsvbeach(:,:,3);
eqvbeach = histeq(vbeach);
vHSVbeach(:,:,3) = eqvbeach;
vRGBbeach = hsv2rgb(vHSVbeach);
subplot(2,4,3);
imshow(vRGBbeach);
title("intensity equalized beach image ");

%%%%kugu

hsvkugu = rgb2hsv(kugu);
vHSVkugu = hsvkugu;

vkugu = hsvkugu(:,:,3);
eqvkugu = histeq(vkugu);
vHSVkugu(:,:,3) = eqvkugu;
vRGBkugu = hsv2rgb(vHSVkugu);
subplot(2,4,7);
imshow(vRGBkugu);
title("intensity equalized kugu image ");


%%%bbbbb
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%ccccc

sHSVbeach = hsvbeach;

vbeach = hsvbeach(:,:,2);
eqvbeach = histeq(vbeach);
sHSVbeach(:,:,2) = eqvbeach;
sRGBbeach = hsv2rgb(sHSVbeach);
subplot(2,4,4);
imshow(sRGBbeach);
title("saturation equalized beach image ");

%%%%%kugu
sHSVkugu = hsvkugu;

vkugu = hsvkugu(:,:,2);
eqvkugu = histeq(vkugu);
sHSVkugu(:,:,2) = eqvkugu;
sRGBkugu = hsv2rgb(sHSVkugu);
subplot(2,4,8);
imshow(sRGBkugu);
title("saturation equalized kugu image ");





