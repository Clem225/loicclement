clear all;
close all;
k = 0.04;
seuilmax = 50000;
seuilmin = - 6*10^4;
sigma = 1;

%CHARGEMENT DE L'IMAGE
TEMP = imread('sequence1.png');
I1=rgb2gray(TEMP);

%AFFICHAGE DE L'IMAGE
figure('Name', 'Image et son filtre de Sobel');
subplot(1,2,1);
imshow(I1);

%INITIALISATION DES MATRICES POUR LE FILTRE DE SOBEL
M_Sobel_x = [ -1 0 1;
            -2 0 2;
            -1 0 1];
        
M_Sobel_y = [ -1 -2 -1;
            0 0 0;
            1 2 1];
        
%APPLICATION DU FILTRE DE SOBEL
I1_Sobel=function_sobel(I1,M_Sobel_x,M_Sobel_y);

%AFFICHAGE AVEC FILTRE DE SOBEL
subplot(1,2,2);
imshow(I1_Sobel);


%APPLICATION FILTRE SOBEL SELON X ET Y (IX ET IY)
Ix = function_sobel2(I1, M_Sobel_x);
Iy = function_sobel2(I1, M_Sobel_y);

%OBTENTION DE IX2 IY2 ET IXY
Ix2 = Ix.*Ix;
Iy2 = Iy.*Iy;
Ixy = Ix.*Iy;

%CALCUL DE R GRACE A M
R=zeros(size(I1));
for i = 1 : size(I1,1)
    for j = 1 : size(I1,2)
        xc = i-1; %??
        yc = j-1; %??
        w = 1; % w = Gauss(sigma, i, j, xc, yc);
        A = w*Ix2(i,j);
        C = w*Ixy(i,j);
        B = w*Iy2(i,j);
        M = [A, C ;
             C, B];
        R(i,j) = det(double(M)) - k*(trace(double(M)))^2; 
    end
end

% R2=zeros(size(I1));
% %AFFICHAGE DES CONTOURS
% for i = 1 : size(I1,1)
%     for j = 1 : size(I1,2) 
%         if (R(i,j)>seuilmax)
%             R2(i,j)=255;
%         end
%     end
% end
% 
% subplot(1,2,2);
% imshow(R2);

%CARTE DES COINS
COINS=zeros(size(I1));
for i = 1 : size(I1,1)
    for j = 1 : size(I1,2) 
        if (R(i,j)<seuilmin)
            COINS(i,j)=255;
        end
    end
end
figure('Name','Carte des coins');
imshow(COINS);


%AFFICHAGE DES COINS DIRECTEMENT SUR L'IMAGE
R3 = cat(3, I1, I1, I1);
for i = 1 : size(I1,1)
    for j = 1 : size(I1,2) 
        if (R(i,j)<seuilmin) %AFFICHAGE D'UNE CROIX
            %CENTRE
            R3(i,j,1)=0;
            R3(i,j,2)=255;
            R3(i,j,3)=0;
            if (i>10 && j>10)
                for k = 1 : 5
                    %GAUCHE
                    R3(i-k,j,1)=0;
                    R3(i-k,j,2)=255;
                    R3(i-k,j,3)=0;
                    %DROITE
                    R3(i+k,j,1)=0;
                    R3(i+k,j,2)=255;
                    R3(i+k,j,3)=0;
                    %HAUT
                    R3(i,j+k,1)=0;
                    R3(i,j+k,2)=255;
                    R3(i,j+k,3)=0;
                    %BAS
                    R3(i,j-k,1)=0;
                    R3(i,j-k,2)=255;
                    R3(i,j-k,3)=0;
                end
            end
        end
    end
end

figure('Name', 'Detection des coins');
imshow(R3);






% Ix = M_Sobel_x.^2;
% Iy = M_Sobel_y.^2;
% Ixy = M_Sobel_x.*M_Sobel_y;
% 
% A = function_sobel2(I1,Ix);
% B = function_sobel2(I1,Iy);
% C=  function_sobel2(I1,Ixy);
% k=0.04;
% R=uint8(zeros(size1-1));
% %R=((A.*B)-(C.^2))-k*((A+B).^2); % det(M) = A.*B-C.^2    et    trace(M) = A+B
% for i=1:(size1(1)-1)
%     for j=1:(size1(2)-1)
%         R(i,j)=((A(i,j)*B(i,j))-(C(i,j)^2))-k*((A(i,j)+B(i,j))^2);
%     end  
% end
% 
% 
% subplot(1,2,2);
% imshow(R);
% 
