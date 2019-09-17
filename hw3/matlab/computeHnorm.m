function H = computeHnorm(p1, p2)
[n,m]=size(p1);
%Normalize coordinates for each image 
normp1=im2double(p1); 
normp2=im2double(p2);
%compute H using DLT in normilized cooridates 
H =computeH(normp1,normp2);

