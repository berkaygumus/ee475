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

Canny_img = edge(img,'Canny');
hough_tr = zeros(727,181);


for i=1:256
    for j=1:256
        if Canny_img(i,j) == 1
            for theta = -90:1:90
               r = round((i*cosd(theta) + j*sind(theta)));
               
               
               hough_tr(r+364,theta+91) = hough_tr(r+364,theta+91)+1;
           
               
            end
        end
        
    end
end

% [H,T,R] = hough(Canny_img,'RhoResolution',1,'Theta',-90:1:89);
% subplot(2,1,1);
% imshow(img);
% title('gantrycrane.png');
% subplot(2,1,2);
% imshow(imadjust(rescale(H)),'XData',T,'YData',R,...
%       'InitialMagnification','fit');
% title('Hough transform of gantrycrane.png');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;
% colormap(gca,hot);

imgRGB = zeros(256,256,3);
for i=1:256
    for j=1:256
        imgRGB(i,j,:) = Canny_img(i,j);
        dist = round(sqrt(i*i+j*j));
        if i+j ==129 || i+j == 192 || i+j == 320 || i+j== 385 || i-j == 129 || i-j == 64 || j-i == 129 ||j-i == 64
            imgRGB(i,j,1) = 1;
            imgRGB(i,j,2) = 0;
            imgRGB(i,j,3) = 0;
        end
    end
end


figure;
subplot(2,2,1);
imshow(Canny_img);
subplot(2,2,2);
imshow(hough_tr,[]);
xlabel('-90 \leq theta \leq 90');
ylabel('363 > ro > -363');
subplot(2,2,3);
imshow(imgRGB,[]);


