  B= load('../data/bunny.mat'); %loading array
 figure(1);
  q=quiver(B.N(:,:,1),B.N(:,:,2));
  title('Computed Surface Normals');
% calculating the surface which is equal to the radiance emitted from each
% point as z is 1 in this surface and s is (0, 0 ,1) 
 [x,y,z]=size(B.N);
 L=zeros(x,y);
 for i =1 : x
     for j=1 : y
         L (i,j)=B.N(i,j,1);
     end
 end
 
 figure(2);
  imshow(L);
 title(' the radiance emitted from each point ');