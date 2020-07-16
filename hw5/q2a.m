clear;
img = double(imread("Gauss_rgb1.png"));
[size1, size2, size3] = size(img);
label_img = zeros(size1,size2);

%%seed selection
n=3;
seeds_pos = zeros(n,2);
% seeds_pos(1,:) = [127 209];
% seeds_pos(2,:) = [165 370];
% seeds_pos(3,:) = [58 263];

%seeds_pos(1,:) = [269 38];
%seeds_pos(1,:) = [217 310];
%seeds_pos(1,:) = [170 471];
%seeds_pos(1,:) = [59 256];
%seeds_pos(1,:) = [124 443];
seeds_pos(1,:) = [11 5];%%%%%%%%%%%%%%%%%
% seeds_pos(1,:) = [17 25];
seeds_pos(2,:) = [40 76];%%%%%%%%%%%%%%%%%
seeds_pos(3,:) = [106 61];%%%%%%%%%%%%%%%%%

% seeds_pos(1,:) = [280 472];
% seeds_pos(2,:) = [113 243];
% seeds_pos(3,:) = [163 353];

% seed1 = [127 209];
% seed2 = [165 370];
% seed3 = [58 263];


% seed1 = [124 258];
% seed2 = [120 304];
% seed3 = [224 302];

% seed1 = [34 26];
% seed2 = [52 104];
% seed3 = [89 49];
seeds_values = zeros(n,3);

seeds_values(1,:) = img(seeds_pos(1,1),seeds_pos(1,2),:);
seeds_values(2,:) = img(seeds_pos(2,1),seeds_pos(2,2),:);
seeds_values(3,:) = img(seeds_pos(3,1),seeds_pos(3,2),:);

reg_values = zeros(n,size1*size2,3);

reg_values(1,1,:) = seeds_values(1,:);
reg_values(2,1,:) = seeds_values(2,:);
reg_values(3,1,:) = seeds_values(3,:);

reg_pos = zeros(n,size1*size2,2);

reg_pos(1,1,:) = seeds_pos(1,:);
reg_pos(2,1,:) = seeds_pos(2,:);
reg_pos(3,1,:) = seeds_pos(3,:);

avg_values = zeros(n,3);

avg_values(1,:) = seeds_values(1,:);
avg_values(2,:) = seeds_values(2,:);
avg_values(3,:) = seeds_values(3,:);

total_values = zeros(n,3);

total_values(1,:) = seeds_values(1,:);
total_values(2,:) = seeds_values(2,:);
total_values(3,:) = seeds_values(3,:);


label_img(reg_pos(1,1,1),reg_pos(1,1,2)) = 1;
label_img(reg_pos(2,1,1),reg_pos(2,1,2)) = 2;
label_img(reg_pos(3,1,1),reg_pos(3,1,2)) = 3;

n_region = zeros(n);
n_region(1) = 1;
n_region(2) = 1;
n_region(3) = 1;

%%%%%%%%%%%%%%%ground truth
grt = zeros(128);
for i=1:128
    for j=1:128
        if i>64
            grt(i,j) = 3;
        else
            if j>64
                grt(i,j) = 2;
            else 
                grt(i,j) = 1;
            end
        end
    end
end

   


%%%%%%%%%%%%%%%

%%%%%
threshold = 5;
d_threshold = 10;

n_pixels = n;
old_n_pixels = n;


while n_pixels < size1*size2
    for l=1:n %labels
       for p=1:n_region(l) %pixels at labels
          if label_img(reg_pos(l,p,1),reg_pos(l,p,2)) == l %center pixels to check its adjacencies
              i = reg_pos(l,p,1);
              j = reg_pos(l,p,2);
              for a=-1:1
                  for b=-1:1
                      ii=i+a;
                      jj=j+b;
                      if ii>0 && jj>0 && ii<size1+1 && jj<size2+1
                          if label_img(ii,jj)==0
                             value(1,:) = img(ii,jj,:);
                             dist = norm(value-avg_values(l,:));
                             if dist < threshold
                                n_region(l) = n_region(l) +1;
                                reg_pos(l,n_region(l),:) = [ii jj];
                                reg_values(l,n_region(l),:) = value;
                                total_values(l,:) = total_values(l,:) + value;
                                label_img(ii,jj)= l;
                                n_pixels = n_pixels +1;
                                
                             end
                          end                         
                      end
                  end
              end
          end
            
       end    
       
       avg_values(l,:) = total_values(l,:)/n_region(l);
       
    end
    
    if old_n_pixels == n_pixels
        threshold = threshold + d_threshold
       
    end   
    old_n_pixels = n_pixels;
    
    imshow(label_img/4);

    
end



union1 = 0;
union2 = 0;
union3 = 0;

intersec1 = 0;
intersec2 = 0;
intersec3 = 0;

for i=1:size1
    for j=1:size2
        if label_img(i,j) == 1 || grt(i,j) ==1
            union1 = union1 + 1;
        end
        if label_img(i,j) == 1 && grt(i,j) ==1
            intersec1 = intersec1 + 1;
        end
        
        if label_img(i,j) == 2 || grt(i,j) ==2
            union2 = union2 + 1;
        end
        if label_img(i,j) == 2 && grt(i,j) ==2
            intersec2 = intersec2 + 1;
        end
        
        if label_img(i,j) == 3 || grt(i,j) ==3
            union3 = union3 + 1;
        end
        if label_img(i,j) == 3 && grt(i,j) ==3
            intersec3 = intersec3 + 1;
        end
    end
end

union = union1 + union2 + union3;
intersect = intersec1 + intersec2 + intersec3;
intersec1/union1
intersec2/union2
intersec3/union3
success = intersect/union

 figure;
    subplot(1,3,1);
    imshow(uint8(img));
    title("image");
    subplot(1,3,2);
    imshow(grt/4);
    title("ground truth");
    subplot(1,3,3);
    imshow(label_img/4);
    title("result (success: "+success+")" );
