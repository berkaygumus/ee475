img = double(rgb2gray(imread("circuitboard.jpg")));
[M,N]= size(img);
noise = randn(M,N)*32;
f = double(img) + noise;
w = ones(7,7)/49;
%%w2 = ones(7,7);
g1 = conv2(f,w,'same');

nn = sum(sum(f<0));
g2=(-1)^2 * exp(conv2(log(abs(f)),w,'same'));



figure;
subplot(2,3,1);
imshow(uint8(img));
title(" original image ");

subplot(2,3,2);
imshow(uint8(f));
title( "with noise");

subplot(2,3,3);
imshow(uint8(g1));
title("arithmetic mean filter");


subplot(2,3,4);
imshow(uint8(g2));
title("geometric mean filter");

%%stdf2 = stdMat(f);
stdf = stdfilt(f,ones(7));

g3 = f - 1024./(stdf.^2) .* ( f - g1);

subplot(2,3,5);
imshow(uint8(g3));
title("adaptive linear filter ");

