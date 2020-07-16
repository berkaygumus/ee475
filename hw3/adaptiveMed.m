function [min max] = adaptiveMed(f)
    mmin = 3;
    mmax = 7;
    min = f;
    max = f;
    med = medfilt2(f,[7 7]);
    [M,N] = size(f);
    for x=1:M
       for y=1:N
           indexX1= x-3;
           indexX2= x+3;
           indexY1= y-3;
           indexY2= y+3;
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
           sub = f(indexX1:indexX2,indexY1:indexY2);
           min(x,y) = 3;%%min(min(sub));
           max(x,y) = 4;%%max(max(sub));
          
       end
    end
end

