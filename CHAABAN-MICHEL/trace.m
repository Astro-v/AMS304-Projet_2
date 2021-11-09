function [p]=trace(s)
    b = B(s);
    a = A(s);
    p = a\b;
end