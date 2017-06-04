function w = Gauss(sigma, x, y, xc, yc)
    w = (1/2*pi*sigma^2)*exp(((x-xc)^2+(y-yc)^2)/2*sigma^2);
end