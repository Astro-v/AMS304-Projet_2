function [b] = secondMembre(s)
    b = [];
    for i=[1:1:size(s,2)-1] 
        b = [b -quadratureB(3,s(:,i),s(:,i+1),@uinc)];
    end
    b = [b -quadratureB(3,s(:,size(s,2)),s(:,1),@uinc)];
end