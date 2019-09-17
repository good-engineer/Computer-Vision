function [affineLKContext] = initAffineLKTracker(img, mask) 

%make template image : crop the template but the gradient does not work
%well

[row,col]=find(mask);%my code problem 
template= img(row(1):row(end),col(1):col(end));
%figure;
%imshow(template);

%for i=1:size(img,1)
 % for j=1:size(img,2)
  % template(i,j)=img(i,j)*mask(i,j);
  %end
%end
%this cause the G to be zero

%figure
%imshow(template);
% Make all x,y indices
[x,y]=ndgrid(0:size(template,1)-1,0:size(template,2)-1);
TemplateCenter=size(template)/2;
x=x-TemplateCenter(1);
y=y-TemplateCenter(2);


%  Jacobian dW/ dp 
Jacobian_x=[x(:) zeros(size(x(:))) y(:) zeros(size(x(:))) ones(size(x(:))) zeros(size(x(:)))];

Jacobian_y=[zeros(size(x(:))) x(:) zeros(size(x(:))) y(:) zeros(size(x(:))) ones(size(x(:)))];

Jacobian=[Jacobian_x; Jacobian_y];
% image gradient * dW /dp

%[G_x,G_y]=gradient(template); my code probelm 
% Gradient of the image
[G_x,G_y]=derivatives(template,3);

G=zeros(numel(x),6);
 for j=1:numel(x)
      Jacobian=[Jacobian_x(j,:); Jacobian_y(j,:)];
      Gradient=[G_x(j) G_y(j)];
     % disp(Gradient);
      %disp(Jacobian);
      G(j,1:6)=Gradient*Jacobian;
 end
%disp(size(G));
% Hessian matrix using equation 11
H=zeros(6,6);

for j=1:numel(x)
    H= H+ G(j,:)'*G(j,:);
end
 affineLKContext.Exception=false;

H_inv=inv(H);
% put the output data in the structure 
affineLKContext.G=G;
affineLKContext.Jacobian= Jacobian;
affineLKContext.Hessianinv=H_inv;
end

function [Ix,Iy]=derivatives(I,sigma)

[x,y]=ndgrid(floor(-3*sigma):ceil(3*sigma),floor(-3*sigma):ceil(3*sigma));
Gauss_x=-(x./(2*pi*sigma^4)).*exp(-(x.^2+y.^2)/(2*sigma^2));
Gauss_y=-(y./(2*pi*sigma^4)).*exp(-(x.^2+y.^2)/(2*sigma^2));
%%Filter the images 
Ix = imfilter(I,Gauss_x,'conv');
Iy = imfilter(I,Gauss_y,'conv');

end 