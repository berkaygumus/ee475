function [ep] = EP(grt,exp)

    n_grt = 0;
    n_exp = 0;
    for i=1:256
        for j=1:256
            if grt(i,j) == 0
               n_grt = n_grt+1;
               
               if exp(i,j)==0
                  n_exp = n_exp +1;                  
               else 
                   I = 0;
                   for k = -2:1:2
                      ad_j = j+k;
                      if ad_j >0 && ad_j<257
                          if exp(i,ad_j)==0
                              I = 0.5;
                          end
                      end
                   end
                   n_exp = n_exp +I;                  
               end 
               
            end
        end
    end


ep=n_exp/n_grt;

end

