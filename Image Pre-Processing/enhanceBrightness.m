function Iout = enhanceBrightness(Iin, c)
%Function for enhancing brightness of a loaded image
%This is passed an image and an increment/decrement for brightness fixture.

Lut = brightnessLUT(c);
Iout = intlut(Iin,Lut(:,2));

end

