function Wout = affineTrackerMasked(img, tmp, mask, W, context,niter) 
p=W(:);
%Wout=[ 1+p(1) p(3) p(5); p(2) 1+p(4) p(6); 0 0 1];
for i=1:size(tmp,1)
  for j=1:size(tmp,2)
    tmp(i,j)=tmp(i,j)*mask(i,j);
  end
end

%Jacobian =context.Jacobian;
Hessianinv=context.Hessianinv;
G=context.G;

for i=1:niter
   % wrap the image
   I_wrapped=warpImage(img,W);
   % obtain the error by deducting the image of template 
   deduction=I_wrapped-tmp;
   % if the template is outside the image does break
   if((p(5)>(size(img,1))-1)||(p(6)>(size(img,2)-1))||(p(5)<0)||(p(6)<0))
       break; 
   end
   %using the equation 11
       
   sum=zeros(6,1);
   for k=1:numel(G(1,:))
       sum=sum+G(k,:)'*deduction(k);
   end
   deltap=Hessianinv*sum;
   
   %disp(deltap);
   % old implementation
   %W_deltap=[1+deltap(1) deltap(3) deltap(5) ;deltap(2)  1+deltap(4) deltap(6) ; 0 0 1];
   %w_deltap_inv=inv(W_deltap);
   Wout=zeros(3,3);
 
   %for j=1:numel(w_deltap_inv)
    %   Wout(j)=W_p(j) * w_deltap_inv(j);
   %end
   
   %obtain deltap inverse
   d=(1/((1+deltap(1)).*(1+deltap(4))-deltap(2).*deltap(3)));
   deltap(1)=-deltap(1)-deltap(1).*deltap(4)+deltap(2)*deltap(3);
   deltap(2)=-deltap(2);
   deltap(3)=-deltap(3);
   deltap(4)=-deltap(4)-deltap(1).*deltap(4)+deltap(2)*deltap(3);
   deltap(5)=-deltap(5)-deltap(4).*deltap(5)+deltap(3)*deltap(6);
   deltap(6)=-deltap(5)-deltap(1).*deltap(6)+deltap(2)*deltap(5);
   deltap=(1/d)*deltap;
   %deltap is inversed
   %composing result
   Wt(1)=p(1)+deltap(1)+p(1).*deltap(1)+p(3).*deltap(2);
   Wt(2)=p(2)+deltap(2)+p(1).*deltap(1)+p(4).*deltap(2);
   Wt(3)=p(3)+deltap(3)+p(3).*deltap(1)+p(3).*deltap(4);
   Wt(4)=p(4)+deltap(4)+p(3).*deltap(1)+p(4).*deltap(4);
   Wt(5)=p(5)+deltap(5)+p(5).*deltap(1)+p(3).*deltap(6);
   Wt(6)=p(6)+deltap(6)+p(5).*deltap(1)+p(4).*deltap(6);
  
   Wout=[1+Wout(1) Wout(3) Wout(5); Wout(2) 1+Wout(4) Wout(6); 0 0 1];
  
   % Break if position is satisfied
   if((norm(deltap,2)<0.05)&&(i>6))
       break;
   end
   
end
