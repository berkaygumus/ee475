function [eqInputImg] = equalization2(inputImg)
    %{
       input image >> inputImg
       equalized input image >> eqInputImg   
     %}
    [m,n] = size(inputImg);
     nk = imhist(inputImg);
     outrange = nk(1) + nk(256);
     nk(1) = 0;
     nk(256) = 0;
     totNum = m*n-outrange;
     pdf = nk/totNum;
     cdf = cumsum(pdf);
     lcdf = cdf*255;
     s = uint8(lcdf);

     eqInputImg = uint8(zeros(m,n)); 

     for i = 1:255
        mask = s(i+1)*uint8((inputImg==i));
        eqInputImg = eqInputImg + mask;
     end

end

