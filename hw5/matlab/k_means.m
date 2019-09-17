function Ikm = k_means(I,K) 

%% K-means Segmentation (option: K (Number of Clusters))
I = im2double(I);
F = reshape(I,size(I,1)*size(I,2),3);                 % Color Features
%% K-means
CENTS = F( ceil(rand(K,1)*size(F,1)) ,:);             % Cluster Centers
DAL   = zeros(size(F,1),K+2);                         % Distances and Labels
KMI   = 100;   %did change it to 100                  % K-means Iteration

for n = 1:KMI    
    for i = 1:size(F,1)
        % Iterate over each pixels to compute distance from cluster centers
         for j = 1:K
                DAL(i,j) = norm(F(i,:)-CENTS(j,:));
         end
         
         [Dis, CN] = min(DAL(i,1:K));
         DAL(i,K+1) = CN;
         DAL(i,K+2) = Dis;
       
        
    end
	for i = 1:K
        % Re-locate cluster centroids
        t = (DAL(:,K+1) == i);
        CENTS(i,:) = mean(F(t,:));
        % TF = isnan(A) returns an array the same size as A containing logical 1 (true)
        % where the elements of A are NaNs and logical 0 (false) where they are not. 
        if sum(isnan(CENTS(:))) ~= 0
            TF = find(isnan(CENTS(:,1)) == 1);
            for j = 1:size(TF,1)
                % X = randi(imax) returns a pseudorandom scalar integer between 1 and imax
                temp=randi(size(F,1));
                CENTS(TF(j),:) = F(temp,:);
            end
        end
	end
end

X = zeros(size(F));
for i = 1:K
	idx = find(DAL(:,K+1) == i);
    X(idx,:) = repmat(CENTS(i,:),size(idx,1),1); 
end
Ikm = reshape(X,size(I,1),size(I,2),3);             % Segmented image

end
