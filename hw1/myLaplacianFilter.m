function [result] = myLaplacianFilter(I)
kernel = -1 * ones(3);
kernel(2,2)=8;
result = myImageFilter(I, kernel);