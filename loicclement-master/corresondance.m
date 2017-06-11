function point = corresondance(point1,I1,I2,COINS)
    mat1= I1((point1(1)-1:point1(1)+1),(point1(2)-1:point1(2)+1));
    min=25; % à modifier
    point=[0,0];
    for i = 1 : size(COINS,1)
        for j = 1 : size(COINS,2) 
            if COINS(i,j)==255
                mat2=I2((i-1:i+1),(j-1:j+1));
                somme = sum(sum(abs(double(mat1)-double(mat2)))); %Sum of Absolute Differences
                if somme<min
                    point(1)=i;
                    point(2)=j;
                    min=somme;
                end
            end
        end
    end
    

end 