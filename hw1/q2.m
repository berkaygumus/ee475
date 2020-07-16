img = imread("peppers.png");
subplot(3,4,1);
imshow(img);
title('original pepppers image');

infoimg = imfinfo("peppers.png") %% it gives information of the "peppers.png"

%%%%% question A
rPeppers = img(:,:,1); %red component
gPeppers = img(:,:,2); %green component
bPeppers = img(:,:,3); %blue component

subplot(3,4,2);
imshow(rPeppers);
title('red component');

subplot(3,4,3);
imshow(gPeppers);
title('green component');

subplot(3,4,4);
imshow(bPeppers);
title('blue component');

%%%%% question B
newL = (rPeppers>90 & gPeppers>10 & bPeppers < 40); %%the condition creates a logical matrix
subplot(3,4,5);
imshow(newL);
title('binary image');

%%%%% question C
avgImg = rPeppers/3 + gPeppers/3 + bPeppers/3; %%average of components
subplot(3,4,6);
imshow(avgImg);
title('gray image');


%%%%% question D
subplot(3,4,10);
imhist(avgImg); %it creates the histogram plot.
xlabel('pixel value');
ylabel('number of pixels');

%%%%% question E
dividedby2 = avgImg/2; %the values are divided by 2
subplot(3,4,7);
imshow(dividedby2);
title('dividedby2');

subplot(3,4,11);
imhist(dividedby2);%it creates the histogram plot.
xlabel('pixel value');
ylabel('number of pixels');
%%%%%
plus64 = dividedby2 + 64; %the values are added by 2
subplot(3,4,8);
imshow(plus64);
title('plus64');

subplot(3,4,12);
imhist(plus64);%it creates the histogram plot.
xlabel('pixel value');
ylabel('number of pixels');






