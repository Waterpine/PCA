function [eigenvector, eigenvalue] = PCA(data)
%PCA	Principal Component Analysis
%
%             Input:
%               data       - Data matrix. Each row vector of fea is a data point.
%
%             Output:
%               eigvector - Each column is an embedding function, for a new
%                           data point (row vector) x,  y = x*eigvector
%                           will be the embedding result of x.
%               eigvalue  - The sorted eigvalue of PCA eigen-problem.
%

% YOUR CODE HERE
[N, ~] = size(data);
meanv = mean(data);
meanv_N = repmat(meanv, N, 1);
nor_data = data - meanv_N;
co = nor_data' * nor_data / N;
[eigenvector, eigenvalue] = eig(co);

eigenvector = fliplr(eigenvector);
eigenvalue = fliplr(eigenvalue);
eigenvalue = flipud(eigenvalue);
end