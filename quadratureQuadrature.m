function [I] = quadratureQuadrature(n,a1,b1,a2,b2)
    % n : entre 2 et 7
    % a,b : sont les coordonés des points dans R^2
    % f : function
   if (n==2)
       w = [1,1];
       ksi = [-1/sqrt(3),1/sqrt(3)];
   elseif (n==3)
       w = [8/9,5/9,5/9];
       ksi = [0,-sqrt(3/5),sqrt(3/5)];
   else
       w = [8/9,5/9,5/9];
       ksi = [0,-sqrt(3/5),sqrt(3/5)];
   end
   I = 0;
   for ind=[1:1:n]
       y = ksi(ind).*((b1-a1)/2)+(b1+a1)/2;
       I = I +  norm(b1-a1)*w(ind)*quadrature(n,a2,b2,@f,y)/2.0;
   end
end