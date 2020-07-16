img = double(imread("Gonzalez_Rose.jpg"))/255;
NumberNoise = 10;
NumberFilter = 6;
ssimdata1 = zeros(NumberNoise,NumberFilter);
ssimdata2 = zeros(NumberNoise,1);


%%original vs filtered
for noiseValue=1:NumberNoise
    I = imnoise(img,'salt & pepper',0.03*noiseValue);
    ssimdata2(noiseValue,1) = ssim(I,img);
    for filterValue = 1:NumberFilter
        k = filterValue*2 + 1;
        J = medfilt2(I,[k k]);
        ssimdata1(noiseValue,filterValue) = ssim(J,img);
    end
end


colormap(flipud(jet));figure(1);x=0.03:0.03:0.30;y=3:2:13;imagesc(x,y,ssimdata1'),colorbar;xlabel('salt-pepper noise value: 3%-30%');ylabel('median filter value:  ');title('SSIM after filter ');

colormap(flipud(jet));figure(2); x=3:3:30;y=0;imagesc(x,y,ssimdata2'),colorbar;xlabel('salt-pepper noise value: 0.03%-0.30%');title('SSIM before filter ');