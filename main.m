%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                        TP1 AMS304                        %%%%%%%%%
%%%%%%%%% Représentation intégrale pour l’équation de Helmholtz 2D %%%%%%%%%
%%%%%%%%%               Farah CHAABA & Valentin MICHEL             %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 0. Initialisation
global k;k = 2*pi;
global R;R = 1;
global dens;dens = 20;

[s,c] = mesh(R,dens,k);

%% 1. Second membre
b = secondMembre(s);

%% 2. Matrice A
A = matriceA(s);

%% 3. Second membre
b=secondMembre(s);