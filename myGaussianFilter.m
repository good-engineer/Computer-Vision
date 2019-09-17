function [result] = myGaussianFilter(I,s)
n=5;
kernel = zeros(n);
a = 1/(2*pi*s*s);
s_sq_by2 = (s.^2) * 2;


for i = 1 : n
    y = i - (n/2) ;
    for j = 1 : n
        x = j - (n/2) ;
        kernel(i,j) =  a * exp((-1 *(x.^2+ y.^2))/s_sq_by2);
          
    end
end

result = myImageFilter(I,kernel);

