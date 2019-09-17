function H = computeHnorm(p1, p2)
[m,n]=size(p1);
H=zeros(3,3);
h=zeros(9,1);

k=10;
randnum=4;
C=zeros(randnum,9);
idx=zeros(randnum); %number of random points
% detect key points
for count=1 :k-1
    
    for i=1:randnum
         idx(i)=round((n-1).*rand(1,1)+1);
    end
    for i=1:randnum
         x1(count,i)=p1(1,indx(i));
         y1(count,i)=p1(2,indx(i));
         x2(count,i)=p2(1,indx(i));
         y2(count,i)=p2(2,indx(i));
    end
    cost(count)=0; 
    %caculate the error and choose the minimum cost 
    for i=1:randnum
         rx(i)=x1(count,i)+(x2(count,i)-x1(count,i))-x2(count,i);
         ry(i)=y1(count,i)+(y2(count,i)-y1(count,i))-y2(count,i);
         cost(count)=cost(count)+rx(i).^2 +ry(i).^2;
    end
    if count==1
        keycost=cost(count);
        for i=1:randnum
            X1(i)=x1(count,i);
            Y1(i)=y1(count,i);
            X2(i)=x2(count,i);
            Y2(i)=y2(count,i);
        end
        
    end
    % repeat this process for k times and choose the min cost 
    if cost(count)<keycost
        keycost=cost(count);
        for i=1:randnum
            X1(i)=x1(count,i);
            Y1(i)=y1(count,i);
            X2(i)=x2(count,i);
            Y2(i)=y2(count,i);
        end
    end        
end
for i=1:randnum
         A(i)=[X1(i),Y1(i),1];
         B(i)=[X2(i),Y2(i),1];
end
    
     t=1;
     % Calculate C as  CH=0
     for i=1:randnum
         C(t)=[-A(i,1) -A(i,2) -A(1,3) 0 0 0 (A(i,1).*B(i,1)) (A(i,2).*B(i,1)) (B(i,1))];
         C(t+1)=[0 0 0 -A(i,1) -A(i,2) -A(1,3) (A(i,1).*B(i,2)) (A(i,2).*B(i,2)) (B(i,2))];
         t=t+2;
     end
     % calculate h
     [U,S,V]= svd(C); 
     h=V(:,end);
     H= [h(1) h(2) h(3);h(4) h(5) h(6); h(7) h(8) h(9)];
   