function [minn,maxx] = minmax(img,m)
    a = (m-1)/2;
    [M,N] = size(img);
     for x=1:M
        for y=1:N
           indexX1= x-a;
           indexX2= x+a;
           indexY1= y-a;
           indexY2= y+a;
           if indexX1 < 1
                 indexX1 = 1;
           end
           if indexX2 > M
                 indexX2 = M;
           end
           if indexY1 < 1
                indexY1 = 1;
           end
           if indexY2 > N
               indexY2 = N;
           end
           sub = img(indexX1:indexX2,indexY1:indexY2);
           minn(x,y) = min(min(sub));
           maxx(x,y) = max(max(sub));

        end
     end
end

