function [chidist,kldist] = chiDistance(img1,img2)
    hist1 = imhist(img1);
    hist2 = imhist(img2);
    p = hist1;
    q = hist2;
    %%% chi dist
    chisum = 0;
    for i = 1:256
        if (p(i) + q(i)) ~= 0
            temp = ((abs(p(i)-q(i)))^2)/(p(i)+q(i));
            chisum = chisum + temp;
        end
        
    end

    chidist = sqrt(chisum/2);
    
    %%%KL dist
    kullsum = 0;
    for i = 1:256
        if p(i)*q(i) ~= 0
           temp2 = -p(i)*log2(q(i)/p(i)) + q(i)*log2(p(i)/q(i));
           kullsum = kullsum + temp2;
        end

    end

    kldist = kullsum /2;
end

