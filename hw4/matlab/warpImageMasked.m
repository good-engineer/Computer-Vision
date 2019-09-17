function [img_warped] = warpImageMasked(img, mask, W) 
%new method
[row,col]=find(mask);
template= img(row(1):row(end),col(1):col(end));
img_warped=wrapImage(template,W);


%new method

% get size of template area and img
%[R,C,D] = size(im);
%warpim = zeros([R,C,D]);

% compute all points in the warped image

%disp(row);

%disp(col);
%[row,col]=find(mask);
%template= im(row(1):row(end),col(1):col(end));

% Make all x,y indices
%[wX,wY]=ndgrid(0:size(template,1)-1,0:size(template,2)-1);

%disp([wX,wY]);
%allwp = [wX(:)';wY(:)';ones(1,(size(template,1)-1)*(size(template,2)-1))];
%allwp = [wX(:)';wY(:)';ones(1,R*C)];

% compute the inverse warped positions in the original image
%alluwp = W \ allwp;
%alluwp(1,:) = alluwp(1,:) ./ alluwp(3,:);
%alluwp(2,:) = alluwp(2,:) ./ alluwp(3,:);

% compute the image values for each dimension
%for i = 1:D
   % warpimi = interp2(im(:,:,i),alluwp(1,:),alluwp(2,:),'nearest',-1e6);
    %warpim(:,:,i) = reshape(warpimi,R,C);
%end
    