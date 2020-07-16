function [g] = stdMat(f)
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
           g(x,y) = std2(sub);
       end
    end
end

