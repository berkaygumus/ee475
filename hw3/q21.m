img = rgb2gray(imread("pentagon.jpg"));
noised = imnoise(img,'salt & pepper',0.25);
figure;
subplot(2,2,1);
imshow(img);
title('original image');
subplot(2,2,2);
imshow(noised);
title('noised image');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
med7 = medfilt2(noised,[7 7]);
subplot(2,2,3);
imshow(med7);
title('after median filter');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

min3 = ordfilt2(noised,1,ones(3));
min5 = ordfilt2(noised,1,ones(5));
min7 = ordfilt2(noised,1,ones(7));

max3 = ordfilt2(noised,9,ones(3));
max5 = ordfilt2(noised,25,ones(5));
max7 = ordfilt2(noised,49,ones(7));

med3 = medfilt2(noised,[3 3]);
med5 = medfilt2(noised,[5 5]);


 mmin = 3;
 mmax = 7;
 a=1;
 [M,N] = size(noised);
 adaptFiltered = zeros(M,N);
 for x=1:M
    for y=1:N
       A1 = double(med3(x,y)) - double(min3(x,y));
       A2 = double(med3(x,y)) - double(max3(x,y));
       if(A1>0 && A2<0)
           adaptFiltered(x,y)= stageb(noised(x,y),min3(x,y),med3(x,y),max3(x,y));
           
       else
           A1 = double(med5(x,y)) - double(min5(x,y));
           A2 = double(med5(x,y)) - double(max5(x,y));
           if(A1>0 && A2<0)
               adaptFiltered(x,y)=stageb(noised(x,y),min5(x,y),med5(x,y),max5(x,y));
               5;
           else
               A1 = double(med7(x,y)) - double(min7(x,y));
               A2 = double(med7(x,y)) - double(max7(x,y));
               adaptFiltered(x,y)=stageb(noised(x,y),min7(x,y),med7(x,y),max7(x,y));
               7;
           end     
       end             
    end
 end
 
 
subplot(2,2,4);
imshow(uint8(adaptFiltered)); 
title('after adaptfilter');



 
 
 
 
 
 
 
 