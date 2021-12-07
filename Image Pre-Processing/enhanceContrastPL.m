function Iout = enhanceContrastPL(Iin,gamma)
%ENHANCECONTRASTPL more aggressive contrast enhancement
%   return an image Iout
%   If gamma >1 we are enhancing contrast in bright regions
%   If gamma <1 we are enhancing contrast in dark regions
%   Create the Lut using the contrast_PL_LUT function for argument of gamma
%   then use intlut
Lut = contrast_PL_LUT(gamma);
Iout = intlut(Iin,Lut);
end
