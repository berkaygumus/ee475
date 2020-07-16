function [] = plotImg(imgA,imgB,imgC,imgD,figureName,titleName)
    figure('Name',figureName,'NumberTitle','off');

    subplot(2,2,1);
    imshow(imgA);
    title(titleName + " A");

    subplot(2,2,2);
    imshow(imgB);
    title(titleName + " B");

    subplot(2,2,3);
    imshow(imgC);
    title(titleName + " C");

    subplot(2,2,4);
    imshow(imgD);
    title(titleName + " D");

    figure('Name','Histograms of '+ figureName ,'NumberTitle','off');

    subplot(2,2,1);
    imhist(imgA);
    title(titleName + " A");

    subplot(2,2,2);
    imhist(imgB);
    title(titleName + " B");

    subplot(2,2,3);
    imhist(imgC);
    title(titleName + " C");

    subplot(2,2,4);
    imhist(imgD);
    title(titleName + " D");
    
    
end

