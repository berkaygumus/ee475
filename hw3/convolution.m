function [g] = convolution(f,w)
    [M,N] = size(f);
    [m,n] = size(w);

    g = zeros(M,N);

    for x=1:M
       for y=1:N
           sum = 0;
           for s=1:m
               for t=1:n
                   if ((x-s+(m+1)/2)>0 && (x-s+(m+1)/2)<M+1  && (y-t+(n+1)/2)>0 && (y-t+(n+1)/2)<N+1)
                        sum = sum + w(s,t)*f(x-s+(m+1)/2,y-t+(n+1)/2);
                   end
               end
           end
           g(x,y) = sum;
       end
    end
end

