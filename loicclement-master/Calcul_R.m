function R = Calcul_R(I1,M_Sobel_x,M_Sobel_y, k)
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


end 