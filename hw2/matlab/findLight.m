function[lv]= findLight(img, cx, cy, r)
[M,I]=max(img(:));
[a,b]=ind2sub(size(img),I);
n=[(a-cx),(b-cy),r];
temp= n(1)*n(1)+n(2)*n(2)+n(3)*n(3);
temp=sqrt(temp);
lv=[n(1)/temp,n(2)/temp,n(3)/temp];
%The intensity of the light source is proportional to the magnitude (brightness) of the brightest pixel on the sphere, scale the direction vector lv so that its length equals this value.
