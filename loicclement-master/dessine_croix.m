function R3 = dessine_croix(R3,i,j,r,v,b)
    %CENTRE
    R3(i,j,1)=r;
    R3(i,j,2)=v;
    R3(i,j,3)=b;
    if (i>10 && j>10)
        for k = 1 : 5
          %GAUCHE
          R3(i-k,j,1)=r;
          R3(i-k,j,2)=v;
          R3(i-k,j,3)=b;
          %DROITE
          R3(i+k,j,1)=r;
          R3(i+k,j,2)=v;
          R3(i+k,j,3)=b;
          %HAUT
          R3(i,j+k,1)=r;
          R3(i,j+k,2)=v;
          R3(i,j+k,3)=b;
          %BAS
          R3(i,j-k,1)=r;
          R3(i,j-k,2)=v;
          R3(i,j-k,3)=b;
        end
   end
end