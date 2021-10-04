function [I]=quadratureA(a,b)
    n = 3;
    w = [8/9,5/9,5/9];
    ksi = [0,-sqrt(3/5),sqrt(3/5)];
    I = 0;
    for ind=[1:1:n]
       y = ksi(ind).*((b-a)/2)+(b+a)/2;
       I = I +  norm(b-a)*w(ind)*B(a,b,y)/2.0;
    end
end