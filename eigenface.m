load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');
% YOUR CODE HERE

% 1. Feature preprocessing
fea_Test = fea_Test / 255;
figure;
show_face(fea_Test);
% 2. Run PCA
[eigenvector,~] = pca(fea_Test);
pc =  eigenvector(:,1:200);


figure;
show_face(pc');
