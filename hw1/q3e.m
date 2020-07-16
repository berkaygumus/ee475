taxi36 = double(imread("taxi36.pgm"));
taxi38 = double(imread("taxi38.pgm"));
taxi40 = double(imread("taxi40.pgm"));
dif13 = uint8((abs(taxi40-taxi36))); %%substraction of images

subplot(1,3,1);
imshow(dif13);
title('subtraction of images');

dif100log = (uint8((abs(taxi40-taxi36)))>100); %%threshold is 100 and it creates a binary image 
subplot(1,3,2);
imshow(dif100log);
title('threshold 100');

threshold = 172; 
difthresholdlog = (uint8((abs(taxi40-taxi36)))>threshold);%%it creates a binary image for spesific threshold
subplot(1,3,2);
subplot(1,3,3);
imshow(difthresholdlog);
title('threshold 172');