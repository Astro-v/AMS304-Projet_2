function [matriceA]=Ab(s)
    global N;
    global n;
    global w;
    global ksi;
    global k;
    matriceA = zeros(N,N);
%     ai = s(:,:);
%     bi = [s(:,2:end) s(:,1)];
%     aj = s(:,:);
%     bj = [s(:,2:end) s(:,1)];
    for i=[1:1:N]
        ai = s(:,i);
        bi = s(:,mod(i,N)+1);
        for j=[1:1:i]
            aj = s(:,j);
            bj = s(:,mod(j,N)+1);
            if (i~=j)
               x1 = ksi*((bi-ai)'/2)+(bi+ai)'/2;
               x2 = ksi*((bj-aj)'/2)+(bj+aj)'/2;
               matriceA(i,j)=(1i/4)*((norm(bj-aj)*w/2).'*besselh(0,k*sqrt((x1(:,1)-x2(:,1)').^2+(x1(:,2)-x2(:,2)').^2))*((norm(bi-ai)*w/2)));
               matriceA(j,i)=matriceA(i,j);
            else
                x = ksi*((bi-ai)'/2)+(bi+ai)'/2;
                dj1=bi'-x;
                dj=ai'-x;
                taue=(bi-ai)/norm(bi-ai);
                I = (-1/(2*pi))*(dj1'*taue*log(sqrt((dj1(:,1)).^2+(dj1(:,2)).^2))-dj'*taue*log(norm(dj))-norm(bi-ai))+(1i/4-(1/(2*pi))*(log(k/2)+0.5772156649))*norm(bi-ai);
                matriceA(i,j) = matriceA(i,j) + (norm(bi-ai)*w(ind)/2)*I;
            end
        end
    end
end