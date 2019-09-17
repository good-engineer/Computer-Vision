function [M,t] = mySobelFilter(I)
x=[-1 0 1;-2 0 2; -1 0 1 ];
y=x';
G=myGaussianFilter(I, 1.1);
Ix=myImageFilter(G,x);
Iy=myImageFilter(G,y);
M = sqrt( Ix.^2 + Iy.^2);
t = atan2(Iy,Ix);
