function [I] = myNonMaximumSuppression(M,T)
T=T*(180/pi);
[n,m]= size(M);
I= zeros(n,m);
for i=1: n
    for j=1 : m
        if ((T(i,j) >0 && T(i,j) < 22.5 ) || (T(i,j)>157.5 && T(i,j)< -157.5))
            T(i,j)=0;
        
        elseif ((T(i,j) >22.5 && T(i,j) < 67.5 )|| (T(i,j)< -112.5 && T(i,j)> -157.5))
            T(i,j)=45;
        
        elseif ((T(i,j) >67.5 && T(i,j) < 112.5 )||( T(i,j)< -67.5 && T(i,j)> -112.5))
            T(i,j)=90;
        
        else  ((T(i,j) > 112.5 && T(i,j) < 157.5 ) || (T(i,j)< -22.5 && T(i,j)> -67.5)) 
            T(i,j)=135;
            
        end
    end
end

for i=2 : n-1
    for j=2 : m-1
        if (T(i,j)==0)
            if((M(i,j)> M(i,j+1)) && (M(i,j)>M(i,j-1)))
                I(i,j)=M(i,j);
            else 
                I(i,j)=0;
            end
         
        elseif (T(i,j)==45)
            if((M(i,j)>M(i-1,j+1)) && (M(i,j)>M(i+1,j-1)))
                I(i,j)=M(i,j);
            else 
                I(i,j)=0;
            end
         
        elseif (T(i,j)==90)
            if((M(i,j)>M(i-1,j)) && (M(i,j)>M(i+1,j)))
                I(i,j)=M(i,j);
            else 
                I(i,j)=0;
            end
            
         else
            if((M(i,j)>M(i-1,j-1)) && (M(i,j)>M(i+1,j+1)))
                I(i,j)=M(i,j);
            else 
                I(i,j)=0;
            end
        end 
    end
end

            