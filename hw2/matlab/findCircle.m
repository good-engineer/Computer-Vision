function [cx, cy,r]= findCircle (img, threshold)
[x,y]= size(img);
cx=1;
tempy=1;
cy=1;
tempx=1;
r=1;

binary=zeros(x,y); % obtain the binary image first
 for i=1:x 
     for j=1:y 
        if img(i, j) >= threshold 
            binary(i, j) = 1; 
        else
            binary(i, j)=0; 
        end
     end
 end
 
 for i=1 : x-5
     for j=1 : y 
         if ((binary(i,j)==1) && (binary(i+2,j)==1) && (binary(i+5,j)==1))              
              tempx =i; % Top of the circle
              cy=j;
              break
         end
     end
 end
 
 for j=1:y-5
     for i=1:x
         if ((binary(i,j)==1) && (binary(i,j+2)==1) && (binary(i,j+5)==1))
             tempy=j; % the most Left piont on border of the circle
             cx=i;  
             break
         end
     end
 end
 
 r=((tempx-cx)+(tempy-cy))/2; 
 
 