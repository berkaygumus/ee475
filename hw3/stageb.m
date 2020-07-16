function [z] = stageb(zxy,zmin,zmed,zmax)
    B1 = double(zxy) - double(zmin);
    B2 = double(zxy) - double(zmax);
    if(B1 > 0 && B2 < 0)
        z = zxy;
    else
        z = zmed;
    end
end

