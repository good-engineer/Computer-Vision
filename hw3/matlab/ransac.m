function [line,inliers] = ransac(points,iter,thr,mininlier)
[m, n]=size(points);
line=zeros(1,2);
inliers=zeros(n);

 for i=1:iter %number of samples
    p1=round((n-1).*rand(1,1)+1); %random point 1
    p2=round((n-1).*rand(1,1)+1); %random point 2
    %ax+by+c=0 , a= y2-y1 / x1-x2 ,  b= -1 , c= y1- a*x1
    a=(points(2,p2)-points(2,p1))./(points(1,p2)-points(1,p1)); 
    c=points(2,p1)-(a.*points(1,p1));
    k=0;% inliers index
    for j=1:n
        %there are 2 ways for calculating the distace of the point from
        %line first is as below commented lines but something was wrong
        %with the answer so just used the distace equation 
        %p2p1=points(:,p2)-points(:,p1);
        %jp1=points(:,j)-points(:,p1);
        %d=norm(jp1-dot(jp1,p2p1)./dot(p2p1,p2p1).*p2p1);
        %the distace of each point to line and change it as inliner if the distance is less than thr  
        d=abs((a.*points(1,j))-points(2,j)+c)./sqrt((a.^2 )+1);
        if( d <thr)
            inliers(j)=1;
            k=k+1; %number of inliners of 
        end
    end
    if k>mininlier
        line=[a,c];
        %in the question is mentioned to plot 6 iterations, at first I
        %thought that we had to output 6 lines but later after cheking
        %matlab builtin function got that it is not true so in case just
        %did comment the old lines
        %line(iter,:)=v;
        %if iter>1
         %  iter=iter-1;
        %end
        mininlier=k; 
    else
        if (i==iter )
             iter=iter+2; %if the desired sline is not found add so sambelling
        end
    end
end
