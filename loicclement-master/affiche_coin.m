function R3 = affiche_coin(I1,R,seuilmin)
R3 = cat(3, I1, I1, I1);
for i = 1 : size(I1,1)
    for j = 1 : size(I1,2) 
        if (R(i,j)<seuilmin) %AFFICHAGE D'UNE CROIX
            R3 = dessine_croix(R3,i,j,0,255,0);            
        end
    end
end
end 