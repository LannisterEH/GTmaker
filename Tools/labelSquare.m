function I = labelSquare(I, color, x, y, height, width, mode)
% mode=0 mean orignal image (left part)
% mode=1 mean Gorind Truth (right part)

[~, ~, c] = size(I);
square = ones(height, width, c)*color;

if mode == 0
    I(x:x+height-1, y:y+width-1, 1) = I(x:x+height-1, y:y+width-1, 1)-100;
    I(x:x+height-1, y:y+width-1, 2) = I(x:x+height-1, y:y+width-1, 2)-100;
    I(x:x+height-1, y:y+width-1, 3) = I(x:x+height-1, y:y+width-1, 3)-50;
else
    I(x:x+height-1, y:y+width-1, :) = square;
end

return