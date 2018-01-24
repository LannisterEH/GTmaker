function I = ColorCorrection(I)

[h, w, c] = size(I);
if c>1
    print('Color Correction is onlu for 2D binary mask~~');
    return
end


for i =1:h
    for j =1:w
        if I(i, j) ~= 255 && I(i, j) ~= 0
            I(i,j) = 0;
        end
    end
end


return