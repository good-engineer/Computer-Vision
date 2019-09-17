pointstemp(1,1:100) = linspace(-1,1); % x: 100 points in [-1,1]
pointstemp(2,1:100)= pointstemp(1,1:100); % y=x
pointstemp(1,101:200)= (2).*rand(100,1)-1; % x: add some random number 
pointstemp(2,101:200)= (2).*rand(100,1)-1; % y: add some random number
randindex=round((199).*rand(200,1)+1); % to uniformly spread points
points=zeros(2,200);
for i=1:200
    points(1,i)=pointstemp(1,randindex(i))*0.1; % add zero mean Gaussian by 0.1 varience 
    points(2,i)=pointstemp(2,randindex(i))*0.1; % add zero mean Gaussian by 0.1 varience 
end

figure
plot(points(1,:),points(2,:),'.')
title('input points')
% now apply RANSAC

for h=1:6
  [line,inliers] = ransac(points,6,0.0001,5);
  thisline=polyval(line,points(1,:)); % draw the line by using polyval function whitch make a equation thisline(x)=line(1)x+line(2)
  figure
   plot(points(1,:),thisline,'-g','LineWidth',0.01) 
   hold on 
   for l= 1:200
       if inliers(l)==1
           plot(points(1,l),points(2,l),'.')
       %else
      %     plot(points(1,l),points(2,l),'ro') % plot outliners
       end
   end
   %legend('Fit','Inlier points','Outlier points')
   hold off
end