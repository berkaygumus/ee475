clear
% n_input = 'number of clusters? ';
% n = input(n_input);
% 
% name_input = 'name of the image? ';
% name = input(name_input,'s');
% img = double(imread(name));

%%%%%%%%%%%%%% input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% the name of image file
img = double(imread("12003.jpg"));
%img = double(imread("HW_Segmen_Image_Gazete.bmp"));
%img = double(imread("PCB.BMP"));
%% n values
n=3;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[size1, size2, size3] = size(img);


i = randi([1 size1],n,1);
j = randi([1 size2],n,1);

avgValues = zeros(n,size3);
oldAvgValues = zeros(n,size3);
totValues = zeros(n,size3);
numOfValues = zeros(n,1);
for t=1:n
    for c =1:size3
       avgValues(t,c) = img(i(t),j(t),c); 
       oldAvgValues(t,c) = img(i(t),j(t),c); 
%        avgValues(t,1) = img(i(t),j(t),1); 
%        avgValues(t,2) = img(i(t),j(t),2); 
%        avgValues(t,3) = img(i(t),j(t),3);  
%        oldAvgValues(t,1) = img(i(t),j(t),1); 
%        oldAvgValues(t,2) = img(i(t),j(t),2); 
%        oldAvgValues(t,3) = img(i(t),j(t),3);  
    end
end

labeled = zeros(size1,size2);

flag = 0;
while flag == 0
    for ii=1:size1
        for jj=1:size2
            min=255*255*3;
            app_l=0;
            for l=1:n
                value(1,:) = img(ii,jj,:);
                dist = norm(avgValues(l,:)-value(1,:));
                if dist < min
                   min = dist;
                   app_l = l;
                   numOfValues(l) = numOfValues(l) + 1;
                   totValues(l,:) = totValues(l,:) + value;
                end            
            end   
            labeled(ii,jj) = app_l;
        end
        imshow(labeled/4);
    end
    
    counter = 0;
    for l=1:n
       avgValues(l,:) = totValues(l,:)/numOfValues(l);
       if norm(avgValues(l,:)-oldAvgValues(l,:))<1
           counter = counter +1;
       end
    end
    
    if counter == n
        flag = 1;
    end
    
    oldAvgValues = avgValues;
    totValues = zeros(n,size3);
    numOfValues = zeros(n,1);
    
    
end    

RGBlabeled = zeros(size1,size2,size3);
for ii=1:size1
    for jj=1:size2
        for l=1:n
            if labeled(ii,jj)==l
                for c=1:size3
                    RGBlabeled(ii,jj,c) =  oldAvgValues(l,c);
                    
%                     RGBlabeled(ii,jj,1) =  oldAvgValues(l,1);
%                     RGBlabeled(ii,jj,2) =  oldAvgValues(l,2);
%                     RGBlabeled(ii,jj,3) =  oldAvgValues(l,3);
                end
            end            
        end        
    end
end
figure;
subplot(1,3,1);
imshow(img/255);
subplot(1,3,2);
imshow(labeled/4);
subplot(1,3,3);
imshow(RGBlabeled/255);
    