function Mat_point = calcul_sobel(I1,M_Sobel1,M_Sobel2)

size1=size(I1);
Mat_point=uint8(zeros(size1));
I1_temp=uint8(zeros(3,3));
        
for i=2:(size1(1)-1)
    for j=2:(size1(2)-1)
        I1_temp = double(I1(i-1:i+1,j-1:j+1));
        Mat_point(i,j)=sqrt(sum(sum(I1_temp.*M_Sobel1))^2 + sum(sum(I1_temp.*M_Sobel2))^2);   
    end       
end

end