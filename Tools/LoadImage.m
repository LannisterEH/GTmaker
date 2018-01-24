function [I] = LoadImage(path, num)

imnames=dir([path '*' 'jpg']); 
I = double(imread(imnames(num).name));

return