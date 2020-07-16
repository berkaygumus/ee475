ast = rgb2gray(imread("astronaut-interference.jpg"));
[Mast,Nast]= size(ast);
figure;
subplot(2,3,1);
imshow(ast);
title('original image');
subplot(2,3,2);
Fast = fft2(ast);
Flogast=fftshift(log(1+abs(Fast)));   
imshow(Flogast,[]);
title('fourier transformation');

thresh1 = double((Flogast>16));

threshast = thresh1 .* Flogast;
subplot(2,3,3);
imshow(threshast,[]);
title('after threshold (zoom in)');

Duv1 = zeros(Mast,Nast);
Duv2 = zeros(Mast,Nast);

for u = 1:Mast 
    for v = 1:Nast
        Duv1(u,v) = sqrt((v-476)*(v-476) + (u-388)*(u-388));
        Duv2(u,v) = sqrt((v-526)*(v-526) + (u-438)*(u-438));
        
    end
end

Huv1 = 1 - exp(-(Duv1.*Duv1)./8);
Huv2 = 1 - exp(-(Duv2.*Duv2)./8);

notchfilt = Huv1.*Huv2;
subplot(2,3,4);
imshow(log(1+(1-notchfilt)),[]);
title('notch filter (inverse)');


filteredAst = fftshift(notchfilt.*(fftshift(Fast)));
xyAst = ifft2(filteredAst);

subplot(2,3,5);
imshow(real(xyAst),[]);
title('filtered image');

subplot(2,3,6);
imshow(abs(double(ast)-real(xyAst))/255);
title('noise pattern');




car = imread("car-interference.jpg");
[Mcar,Ncar]= size(car);
figure;
subplot(2,3,1);
imshow(car);
title('original image');
subplot(2,3,2);
Fcar = fft2(car);
Flogcar=fftshift(log(1+abs(Fcar)));   
imshow(Flogcar,[]);
title('fourier transformation');

thresh2 = double((Flogcar>10));

threshcar = thresh2 .* Flogcar;
subplot(2,3,3);
imshow(threshcar,[]);
title('after threshold');

Duvcar1 = zeros(Mcar,Ncar);
Duvcar2 = zeros(Mcar,Ncar);
Duvcar3 = zeros(Mcar,Ncar);
Duvcar4 = zeros(Mcar,Ncar);
Duvcar5 = zeros(Mcar,Ncar);
Duvcar6 = zeros(Mcar,Ncar);
Duvcar7 = zeros(Mcar,Ncar);
Duvcar8 = zeros(Mcar,Ncar);

for u = 1:Mcar 
    for v = 1:Ncar
        Duvcar1(u,v) = sqrt((v-56)*(v-56) + (u-45)*(u-45));
        Duvcar2(u,v) = sqrt((v-55)*(v-55) + (u-86)*(u-86));
        Duvcar3(u,v) = sqrt((v-58)*(v-58) + (u-166)*(u-166));
        Duvcar4(u,v) = sqrt((v-58)*(v-58) + (u-208)*(u-208));
        Duvcar5(u,v) = sqrt((v-112)*(v-112) + (u-40)*(u-40));
        Duvcar6(u,v) = sqrt((v-112)*(v-112) + (u-82)*(u-82));
        Duvcar7(u,v) = sqrt((v-114)*(v-114) + (u-162)*(u-162));
        Duvcar8(u,v) = sqrt((v-114)*(v-114) + (u-203)*(u-203));
        
    end
end

Huvcar1 = 1 - exp(-(Duvcar1.*Duvcar1)./128);
Huvcar2 = 1 - exp(-(Duvcar2.*Duvcar2)./128);
Huvcar3 = 1 - exp(-(Duvcar3.*Duvcar3)./128);
Huvcar4 = 1 - exp(-(Duvcar4.*Duvcar4)./128);
Huvcar5 = 1 - exp(-(Duvcar5.*Duvcar5)./128);
Huvcar6 = 1 - exp(-(Duvcar6.*Duvcar6)./128);
Huvcar7 = 1 - exp(-(Duvcar7.*Duvcar7)./128);
Huvcar8 = 1 - exp(-(Duvcar8.*Duvcar8)./128);

notchfiltcar = Huvcar1.*Huvcar2.*Huvcar3.*Huvcar4.*Huvcar5.*Huvcar6.*Huvcar7.*Huvcar8;
subplot(2,3,4);
imshow(log(1+(1-notchfiltcar)),[]);
title('notch filter (inverse)');

filteredCar = fftshift(notchfiltcar.*(fftshift(Fcar)));
xyCar = ifft2(filteredCar);

subplot(2,3,5);
imshow(real(xyCar),[]);
title('filtered image');

subplot(2,3,6);
imshow(abs(double(car)-real(xyCar))/255);
title('noise pattern');


