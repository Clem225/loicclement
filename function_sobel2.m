function Mat_point = calcul_sobel2(I1,M_Sobel)

size1=size(I1);
Mat_point=uint8(zeros(size1-1));
I1_temp=uint8(zeros(3,3));

        
for i=2:(size1(1)-1)
    for j=2:(size1(2)-1)
        I1_temp = double(I1(i-1:i+1,j-1:j+1));
        Mat_point(i-1,j-1)=sqrt(sum(sum(I1_temp.*M_Sobel)))^2;   
    end       
end

end