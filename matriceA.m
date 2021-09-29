function [A]=matriceA(s)
    A = [];
    for i=[1:1:size(s,2)-1]
        Ai = [];
        for j=[1:1:size(s,2)-1] 
            Ai = [Ai quadratureQuadrature(3,s(:,i),s(:,i+1),s(:,j),s(:,j+1))];
        end
        Ai = [Ai quadratureQuadrature(3,s(:,i),s(:,i+1),s(:,size(s,2)),s(:,1))];
        A = [A;Ai];
    end
    Ai = [];
    for j=[1:1:size(s,2)-1] 
        Ai = [Ai quadratureQuadrature(3,s(:,size(s,2)),s(:,1),s(:,j),s(:,j+1))];
    end
    Ai = [Ai quadratureQuadrature(3,s(:,size(s,2)),s(:,1),s(:,size(s,2)),s(:,1))];
    A = [A;Ai];
end