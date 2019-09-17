function [normals , albedo] = computeNormals(img1, img2, img3, lv1, lv2, lv3, threshold)
[x,y]=size(img1);
L=[lv1;lv2;lv3]; %light source
normals=zeros(x,y,3);
img=cat(3,img1,img2,img3); %intensity
N=size(img1);
albedo=zeros(x,y);

for i=1 : y 
    for j=1:x
          m=min([img1(i,j),img2(i,j),img3(i,j)]);
          if (m >=threshold ) %eliminating the pixels with low intensity in calculating normals
              for k=1 : 3
                  I(k)=img(i,j,k);
              end
          end
    end
end

for i=1 : y
    for j=1 : x
         m=min([img1(i,j),img2(i,j),img3(i,j)]);
        if (m >=threshold )
            L_inv=inv(L);
            n=L_inv .*I;
            R=norm(n);
            n=n/R;
            normals(i,j,1)=n(1);
            normals(i,j,2)=n(2);
            normals(i,j,3)=n(3);
            albedo(i,j)=R;
         end
    end
end

        


