function [matchedInputImg] = matching(inputImg , refImg)
     %{
       input image >> inputImg
       reference image >> refImg
       equalized input image >> eqInputImg
       equalized reference image >> eqRefImg
       T transform >> s
       G transform >> s2
       inverse G transform for eqInputImg>> invG
       matched input image by ref image >> matchedInputImg
   
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

    %%%input image is equalized   inputImg >> eqInputImg
    %%%%%%%%%%%%%%%%%
    %%%ref image
    
    [m2,n2] = size(refImg);
     nk2 = imhist(refImg);
     outrange2 = nk2(1) + nk2(256);
     nk2(1) = 0;
     nk2(256) = 0;
     totNum2 = m2*n2-outrange2;
     pdf2 = nk2/totNum2;
     cdf2 = cumsum(pdf2);
     lcdf2 = cdf2*255;
     s2 = uint8(lcdf2); %%s2 is G transform

     eqRefImg = uint8(zeros(m2,n2)); 

     for i = 1:255
        mask2 = s2(i+1)*uint8((refImg==i));
        eqRefImg = eqRefImg + mask2;
     end

    %%%ref image is equalized refImg >> eqRefImg
    %%% G transform is created   >> s2
    %%%%%%%%%%%%%%%%%%%%%%%
    %%%inverse of G transform
    
    inv = uint8(zeros(256));
    tempInvG = inv(:,1);
    
    for j = 1 : 256 
        i = 257 - j;
        tempInvG(s2(i)+1) = i-1;
    end

    max = 0;
    invG = tempInvG;
 
    for i = 1 : 256 
        k = invG(i);
        if k==0 
            invG(i) = max;
        else
            max = k;
        end
    end
    
    invG(256) = 255;
    
    %%%%inverse of G is invG
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% invG transformation for equalized input image
    
    matchedInputImg = uint8(zeros(m,n)); 

     for i = 1:255
        mask3 = invG(i+1)*uint8((eqInputImg==i));
        matchedInputImg = matchedInputImg + mask3;
     end
    

end

