%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                        TP1 AMS304                        %%%%%%%%%
%%%%%%%%% Représentation intégrale pour l’équation de Helmholtz 2D %%%%%%%%%
%%%%%%%%%               Farah CHAABA & Valentin MICHEL             %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 0. Initialisation
global k;k = 2*pi;
global R;R = 1;
global dens;dens = 10;

[s,c] = mesh(R,dens,k);

%% 1. Second membre
b = secondMembre(s);

%% 2. Matrice A
A = matA(s);

p=b\A;
pBis=[];
for m = [1:1:size(c,2)]
    pBis = [pBis trace(k,R,c(1,m),c(2,m))];
end

p(1)
pBis(1)