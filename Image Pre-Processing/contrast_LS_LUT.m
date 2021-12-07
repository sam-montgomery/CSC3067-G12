function Lut = contrast_LS_LUT(m,c)
Lut = zeros(256,1);
counter = 0;

for i = 1:256
    if counter < -c/m
        Lut(i,1) = 0;
    elseif counter > (255-c)/m
        Lut(i,1) = 255;
    else
        Lut(i,1) = m*counter+c;
    end 
    counter = counter + 1;
end
Lut=uint8(Lut);
end
