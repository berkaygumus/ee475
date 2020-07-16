ground = zeros(512,512); %%The resoution is determined as 512X512.
for i = 1:512
    for j = 1:512
        radius = sqrt((256-i)^2 + (256-j)^2); %it calculates the distance from center pixel.
        if radius < 65 %for inner circle
            a = rand;%this number between 0 and 1
            a = 2*a -1;%this number between -1 and 1 for noise
            ground(i,j) = a*16/256 + 0.75; %noise is added to mean value.
        
        elseif radius > 64 && radius < 129 %for outer circle
            a = rand;
            a = 2*a -1;
            ground(i,j) = a*42/256 +0.5;
        
        else %for background
            ground(i,j) = 0.25;
        
        end
    end
end
imshow(ground);
imwrite(ground,'q1.tif')