function [u] = resolveAnalytique(s)
    x = s(1);
    y = s(2);
    global k;
    global R;
    r = sqrt(x^2+y^2);
    theta = -i*log((x+i*y)/r);
    n = [-100:1:100];
    u = -(-i).^(n).*besselj(n,k*R)./besselh(n,k*R).*besselh(n,k*r)*exp(i*theta*n).';
end