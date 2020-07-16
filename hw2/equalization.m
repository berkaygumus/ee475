function [eqInputImg] = equalization(inputImg)
    %{
       input image >> inputImg
       equalized input image >> eqInputImg   
     %}
    [m,n] = size(inputImg);
    nk = imhist(inputImg);
    pdf = nk/m/n;
    cdf = cumsum(pdf);
    lcdf = cdf*255;
    s = uint8(lcdf);

    eqInputImg = uint8(zeros(m,n)); 

    for i = 0:255
        mask = s(i+1)*uint8((inputImg==i));
        eqInputImg = eqInputImg + mask;
    end


end

