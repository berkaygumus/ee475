function [g] = geometricConv(f)
   [M,N] = size(f);  
    m=7;
    n=7;
    w = ones(m,n);
    g = zeros(M,N);

    for x=1:M
       for y=1:N
           mult = 0;
           for s=1:m
               for t=1:n
                   if ((x-s+(m+1)/2)>0 && (x-s+(m+1)/2)<M+1  && (y-t+(n+1)/2)>0 && (y-t+(n+1)/2)<N+1)
                        mult =  mult + (f(x-s+(m+1)/2,y-t+(n+1)/2));
                   end
               end
           end
           g(x,y) = mult/(m*n);
       end
    end
end

