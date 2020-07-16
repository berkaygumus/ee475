clear;
img = zeros(256);
for i=1:256
    for j=1:256
       dist = abs(i-128) + abs(j-128);
       if dist < 65
          img(i,j) = 192/255; 
       
       elseif dist < 129
          img(i,j) = 128/255; 
       end
       if dist>128
           img(i,j)= 64/255;
       end 
        
    end
end

noiseImg = 12/255*randn(256)+img;
noiseImg2 = 22/255*randn(256)+img;

temp_sobel = edge(img,'sobel');
sobel = (temp_sobel==0);

temp_canny = edge(img,'Canny');
canny = (temp_canny==0);

temp_sobel_noise = edge(noiseImg,'sobel');
sobel_noise = (temp_sobel_noise==0);

temp_canny_noise = edge(noiseImg,'Canny');
canny_noise = (temp_canny_noise==0);

temp_sobel_noise2 = edge(noiseImg2,'sobel');
sobel_noise2 = (temp_sobel_noise2==0);

temp_canny_noise2 = edge(noiseImg2,'Canny');
canny_noise2 = (temp_canny_noise2==0);

filter = [0,0,-1,0,0;0,-1,-2,-1,0;-1,-2,16,-2,-1;0,-1,-2,-1,0;0,0,-1,0,0];
filter = -filter;

temp_log = conv2(img,filter,'same');
log = (temp_log<0.5);

temp_log_noise = conv2(noiseImg,filter,'same');
log_noise = (temp_log_noise<0.5);

temp_log_noise2 = conv2(noiseImg2,filter,'same');
log_noise2 = (temp_log_noise2<0.5);


sobel1 = EP(sobel,sobel_noise)
canny1 = EP(canny,canny_noise)
log1 = EP(log,log_noise)

sobel2 = EP(sobel,sobel_noise2)
canny2 = EP(canny,canny_noise2)
log2 = EP(log,log_noise2)

figure;
subplot(4,3,1);
imshow(img);
title("image");
subplot(4,3,2);
imshow(noiseImg);
title("noisy image(144)");
subplot(4,3,3);
imshow(noiseImg2);
title("noisy image(484)");

subplot(4,3,4);
imshow(sobel);
title("sobel for image");
subplot(4,3,5);
imshow(canny);
title("canny for image");
subplot(4,3,6);
imshow(log);
title("log for image");

subplot(4,3,7);
imshow(sobel_noise);
title("sobel for noisy(144) image");
subplot(4,3,8);
imshow(canny_noise);
title("canny for noisy(144) image");
subplot(4,3,9);
imshow(log_noise);
title("log for noisy(144) image");

subplot(4,3,10);
imshow(sobel_noise2);
title("sobel for noisy(484) image");
subplot(4,3,11);
imshow(canny_noise2);
title("canny for noisy(484) image");
subplot(4,3,12);
imshow(log_noise2);
title("log for noisy(484) image");
