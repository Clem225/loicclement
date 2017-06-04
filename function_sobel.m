function I1_Sobel = calcul_sobel(I1,M_Sobel1,M_Sobel2)

I1_Sobel=uint8(zeros(size(I1)));
I1_temp=uint8(zeros(3,3));
        
for i=2:(size(I1,1)-1)
    for j=2:(size(I1,2)-1)
        I1_temp = double(I1(i-1:i+1,j-1:j+1));
        I1_Sobel(i,j)=sqrt(sum(sum(I1_temp.*M_Sobel1))^2 + sum(sum(I1_temp.*M_Sobel2))^2);   
    end       
end

end