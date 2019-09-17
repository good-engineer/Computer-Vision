function [E] = myDoubleThresholding(I, hi, lo)
[n,m]=size(I);
E=zeros(n,m);
high = hi* max(I(:));
low =lo* max(I(:));
for i=2 : n-1
    for j=2 : m-1
        if(I(i,j)> high) 
            E(i,j)= 1;
        elseif((I(i,j)>low || (I(i+1,j)>low) || (I(i-1,j)>low) || (I(i,j+1)>low) || (I(i,j-1)>low)))
            E(i,j)=1;
        end
    end   
end

      
            
        