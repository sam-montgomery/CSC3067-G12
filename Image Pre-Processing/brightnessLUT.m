function Lut = brightnessLUT(c)
Lut = zeros(256,2);
for i = 1:256
    Lut(i,1) = i;
    if(i < -c)
        Lut(i,2) = 0;
    elseif (i > 255-c)
        Lut(i,2) = 255;
    else
        Lut(i,2) = i+c;
    end 
end
Lut=uint8(Lut);
end
