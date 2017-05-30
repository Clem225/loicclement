clear all
close all

I2 = imread('img.png');
I1=rgb2gray(I2);
subplot(1,2,1)
imshow(I1);
size1=size(I1);
Mat_point=uint8(zeros(size1));

M_Sobel_x = [ -1 0 1;
            -2 0 2;
            -1 0 1];
        
M_Sobel_y = [ -1 -2 -1;
            0 0 0;
            1 2 1];

Mat_point=function_sobel(I1,M_Sobel_x,M_Sobel_y);

Ix = M_Sobel_x.^2;
Iy = M_Sobel_y.^2;
Ixy = M_Sobel_x.*M_Sobel_y;

A = function_sobel2(I1,Ix);
B = function_sobel2(I1,Iy);
C=  function_sobel2(I1,Ixy);
k=0.04;
R=uint8(zeros(size1-1));
%R=((A.*B)-(C.^2))-k*((A+B).^2); % det(M) = A.*B-C.^2    et    trace(M) = A+B
for i=1:(size1(1)-1)
    for j=1:(size1(2)-1)
        R(i,j)=((A(i,j)*B(i,j))-(C(i,j)^2))-k*((A(i,j)+B(i,j))^2);
    end  
end


subplot(1,2,2);
imshow(R);

