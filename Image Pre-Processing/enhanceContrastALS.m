function [Iout, Lut] = enhanceContrastALS(Iin)

%   Modified version of enhanceContrastLS where m and c are automatically
%   generated without user input. To do this, the initial i1 and end point
%   i2 of the histogram should be detected and used to calculate m and c
min = Iin(1,1);
max = Iin(1,1);

%iterate through rows and cols to find the min and max value
%min (i1) should be around 50 for boat
%max (i2) should be around 200 for boat
for row = 1:256
    for col = 1:256
        if Iin(row,col) < min
            min = Iin(row,col);
        end
    end
end

for row = 1:256
    for col = 1:256
        if Iin(row,col) > max
            max = Iin(row,col);
        end
    end
end

%now we have got our min(i1) and max(i2) variables
%we can calculate slope m
%m equals change in y/change in x
%m equals (O2-O1)/(I2-I1)
%We know that O2 and O1 are always 255 and 0
m = double((255.0-0.0)/double(max-min));

%now we have m, we can get c
%c = -m * I1
c = double(-m) * double(min);

%Now have m and c
Lut = contrast_LS_LUT(m,c);
Iout = intlut(Iin,Lut);
end

