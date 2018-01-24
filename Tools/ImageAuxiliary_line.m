function [I] = ImageAuxiliary_line(I, num)
% I = zeros(256,256);
% I = imread('./frame000251.jpg');
I = double(I);
% I = imresize(double(I), [256,256]);
% num = 4; % for example
[h, w, ~] = size(I);
H = round(h/num);
W = round(w/num);
for i=1:num-1
     I(H*i,:,1) = 255;
     I(H*i,:,2) = 0;
     I(H*i,:,3) = 0;
%      fprintf('\n%d', H*i);
%      figure(2),imshow(I);
     I(:,W*i,1) = 255;
     I(:,W*i,2) = 0;
     I(:,W*i,3) = 0;
%      fprintf('\n%d', W*i);
%      figure(2),imshow(I);
end
% imwrite(I,'test.jpg');
% figure(2),imshow(I);
return