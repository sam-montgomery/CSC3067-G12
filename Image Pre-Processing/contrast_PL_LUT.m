function Lut = contrast_PL_LUT(gamma)
%CONTRAST_PL_LUT 
%   Creating a Lut for input of 0-255 affected by an input of gamma
%   O = (round)[input^gamma / 255^gamma-1]
counter = 0;
Lut = zeros(256,1);
for i=1:256
    Lut(i,1) = round(((counter^gamma) / (255^(gamma-1))));
    counter = counter+1;
end
Lut = uint8(Lut);
end
