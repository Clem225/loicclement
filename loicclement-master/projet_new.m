clear all;
close all;
k = 0.04;
seuilmax = 50000;
seuilmin = - 6.6*10^4;
sigma = 1;

%CHARGEMENT DE L'IMAGE
TEMP = imread('sequence1.png');
I1=rgb2gray(TEMP);

TEMP2 = imread('sequence2.png');
I2=rgb2gray(TEMP2);


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
I2_Sobel=function_sobel(I2,M_Sobel_x,M_Sobel_y);

%AFFICHAGE AVEC FILTRE DE SOBEL
subplot(1,2,2);
imshow(I1_Sobel);


R  = Calcul_R(I1,M_Sobel_x,M_Sobel_y,k);
R2 = Calcul_R(I2,M_Sobel_x,M_Sobel_y,k);

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
COINS=(R<seuilmin)*255;
figure('Name','Carte des coins');
imshow(COINS);

COINS2=(R2<seuilmin)*255;


%AFFICHAGE DES COINS DIRECTEMENT SUR L'IMAGE
R3  = affiche_coin(I1,R ,seuilmin);
R32 = affiche_coin(I2,R2,seuilmin);

figure('Name', 'Detection des coins');
imshow(R3);
figure('Name', 'Detection des coins');
imshow(R32);



% mise en correspondances des coins
R4 = cat(3, I1, I1, I1);
R5 = cat(3, I2, I2, I2);
for i = 1 : size(COINS,1)
        for j = 1 : size(COINS,2) 
            if COINS(i,j)==255 && i~=1 && j~=1
                point=corresondance([i,j],I1,I2,COINS2);
                if point(1)~=0
                    r=uint8(rand(1,1)*255);
                    v=uint8(rand(1,1)*255);
                    b=uint8(rand(1,1)*255);
                    R5=dessine_croix(R5,point(1),point(2),r,v,b);  
                    R4=dessine_croix(R4,i,j,r,v,b);
                end
                break
            end
        end
        
end
figure('Name', 'correspondance des coins');
imshow(R4);

figure('Name', 'correspondance des coins');
imshow(R5);

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
