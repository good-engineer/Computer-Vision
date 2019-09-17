function [globalImg, directImg] = separateGlobalDirect(dirname)

myfolder=dirname;
files=dir([myfolder '/*.png']);
len=length(files);  


for i=1: len
     name=files(i).name;
     img{i} = (double(imread(fullfile(dirname,name))))/255;
end


sum=zeros(len);
[x,y]=size(img{1});
for k=1 :len % for every image did calculate the sum of intesity
    temp=img{k};
    for i=1 : x
        for j=1: y
          sum(k)=sum(k)+temp(i,j);
        end
    end
end

maxidx=1;
minidx=1;
maxsum=sum(1);
minsum=sum(1);
%assume the min sum ans max sum of intesity a mong whole images
for i =2 : len
    if sum(i)>maxsum
        maxsum=sum(i);
        maxidx=i;
    end
    if sum(i)<minsum
        minsum=sum(i);
        minidx=i;
    end    
end
maxImg=img{maxidx};
minImg=img{minidx};

globalImg=2.*minImg;
directImg=maxImg-minImg; 
            