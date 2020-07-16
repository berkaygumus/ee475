figure;

I = imread('lumbercamp.jpg');
subplot(2,4,1);
imshow(I);
title("original photo");
subplot(2,4,2);
imhist(I,256);
title("histogram of original image");


out = equalization(I);
subplot(2,4,3);
imshow(out);
title("photo equalized by me");
subplot(2,4,4);
imhist(out,256);
title("histogram of my equalizatin");

J = histeq(I);
subplot(2,4,5);
imshow(J);
title("photo equalized by histeq");
subplot(2,4,6);
imhist(J,256);
title("histogram of histeq");


W = adapthisteq(I);
subplot(2,4,7)
imshow(W);
title("photo equalized by adapthisteq");
subplot(2,4,8);
imhist(W,256);
title("histogram of adapthisteq");