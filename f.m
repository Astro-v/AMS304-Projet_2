function [y]=f(x,y)
    global k;
    y = besselh(0,k*norm(x-y));
end