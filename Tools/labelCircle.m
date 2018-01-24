function I = labelCircle(I, color, x, y, r, mode)
MARK = 999; % for mark the circle area

i=1:r;
y1(i)  = sqrt(r^2-(i).^2);
yy(i) = sqrt(r^2-(r-i+1).^2);
offset = 0.5;
c = zeros(r*2,r*2);

for i=1:r
    for j=1:r
        if y1(i) >= j+offset
            c(r+i,r+j,:) = MARK;
        end
        
        if yy(i) >= j+offset
            c(i,j+r,:) = MARK;
        end
    end
   
end
RR =  imrotate(c,180);
c(:,1:r,:) = RR(:,1:r,:);
% figure(100);imshow(c);
if mode ==0 % Original image 
    for i=1:2*r
        for j=1:2*r
            if c(i,j) == MARK
                I(x-r+i,y-r+j,1) = I(x-r+i,y-r+j,1)-50;
                I(x-r+i,y-r+j,2) = I(x-r+i,y-r+j,2)-100;
                I(x-r+i,y-r+j,3) = I(x-r+i,y-r+j,3)-100;
            end
        end
    end
    
else % GT (Output Mask)
    for i=1:2*r
        for j=1:2*r
            if c(i,j) == MARK
                I(x-r+i,y-r+j,:) = color;
            end
        end
    end
%     I(x-r:x+r-1,y-r:y+r-1,:) =  cat(3, c, c, c);
%     I(x-r:x+r-1,y-r:y+r-1,2) =  c;
%     I(x-r:x+r-1,y-r:y+r-1,3) =  c;
end
% figure(102);imshow(I);
return
