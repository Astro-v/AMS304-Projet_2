%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%                        TP2 AMS304                        %%%%%%%%%
%%%%%%%%%    Equation intégrale pour l’équation de Helmholtz 2D    %%%%%%%%%
%%%%%%%%%               Farah CHAABA & Valentin MICHEL             %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear();

%% 0. Initialisation
global k;k = 2*pi;
global R;R = 1;
global dens;dens = 20;
global N; N = floor(dens*2*k*R+1);

[s,c] = mesh();

% Quadrature
global w; w = [128/225,(322+13*sqrt(70))/900,(322+13*sqrt(70))/900,(322-13*sqrt(70))/900,(322-13*sqrt(70))/900];
global ksi; ksi = [0,+1/3*sqrt(5-2*sqrt(10/7)),-1/3*sqrt(5-2*sqrt(10/7)),+1/3*sqrt(5+2*sqrt(10/7)),-1/3*sqrt(5+2*sqrt(10/7))];
global n; n=length(ksi);

%% 1. Second membre
b = B(s);

%% 2. Matrice A
a = A(s);

%% 5. Trace p
p = a\b;

figure()
plot(real(-1i.*log((c(1,:)+1i.*c(2,:))./R)),real(p),real(-1i.*log((c(1,:)+1i.*c(2,:))./R)),imag(p))
legend({'Partie réel de la trace de p','Partie réel de la trace de p'})
xlabel('\theta')
ylabel('Trace de p')

%% 6. Validation
pAnalytique = zeros(N,1);
for i=[1:1:N]
    pAnalytique(i) = traceAnalytique(c(1,i),c(2,i));
end

figure()
plot(real(-1i.*log((c(1,:)+1i.*c(2,:))./R)),real(pAnalytique),real(-1i.*log((c(1,:)+1i.*c(2,:))./R)),real(p))
legend({'Partie réel de la trace de p analytique','Partie réel de la trace de p'})
xlabel('\theta')
ylabel('Trace de p')

figure()
plot(real(-1i.*log((c(1,:)+1i.*c(2,:))./R)),imag(pAnalytique),real(-1i.*log((c(1,:)+1i.*c(2,:))./R)),imag(p))
legend({'Partie imaginaire de la trace de p analytique','Partie imaginaire de la trace de p'})
xlabel('\theta')
ylabel('Trace de p')

% liste = [1,10,20,30,40,100];
% err = zeros(length(liste),1);
% for m=[1:1:length(liste)]
%     global N; N = floor(liste(m)*2*k*R+1);N
%     [s,c] = mesh();
%     b = B(s);
%     a = A(s);
%     p = a\b;
%     pAnalytique = zeros(N,1);
%     for i=[1:1:N]
%         pAnalytique(i) = traceAnalytique(c(1,i),c(2,i));
%     end
%     err(m) = norm(p-pAnalytique)/length(p);
% end
% 
% figure()
% loglog(liste,err)
% legend({'Erreur en fonction du nombre de points'})
% xlabel('Nombre de points')
% ylabel('Erreur')

%% 7. Resolution

x = [1:0.01:5];
solution=zeros(length(x),1);
solutionAnalytique=zeros(length(x),1);
for m = [1:1:length(x)]
    solution(m) = resolve(s,p,[x(m);0]);
    solutionAnalytique(m) = resolveAnalytique([x(m),0]);
end
figure()
plot(x,real(solution),x,real(solutionAnalytique))
