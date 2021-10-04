function [y]=B(a,b,x)  
    dj1=b-x;
    dj=a-x;
    taue=(b-a)/norm(b-a);
    y=(-1/(2*pi))*(dj1'*taue*log(norm(dj1))-dj'*taue*log(norm(dj))-norm(b-a));
end