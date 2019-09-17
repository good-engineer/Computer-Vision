function [result] = myImageFilter (I,S)
[ix,iy]= size(I);
[sx,sy] = size(S);
rot = rot90(S,2);
re = zeros(ix + sx*2-2, sy+ iy*2-2);
for i = sx : sx+ix-1
    for j = sy : sy+iy-1
        re(i,j)=I(i-sx+1, j-sy+1);
    end
end
result=zeros(sx+ix-1, iy+sy-1);

for i = 1 : ix+sx-1
    for j= 1 : iy+sy-1
        for x=1 : sx
            for y=1 : sy
                result(i,j) = result(i,j) + (re(i+x-1, j+y-1) * rot(x,y));
            end
        end
    end
end



