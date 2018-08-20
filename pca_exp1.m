load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');
[N,~] = size(fea_Test);
% YOUR CODE HERE
dimension = 128;

% 1. Feature preprocessing
fea_Train = fea_Train / 255;
fea_Test = fea_Test / 255;
figure;
show_face(fea_Train);
% 2. Run PCA
[eigenvector,~] = pca(fea_Train);
pc_Train =  eigenvector(:,1:dimension);
pc_Test =  eigenvector(:,1:dimension);
% 4. Project data on to low dimensional space
low_fea_Train = fea_Train * pc_Train;
low_fea_Test = fea_Test * pc_Test;
% 5. Run KNN in low dimensional space
KNN = fitcknn(low_fea_Train, gnd_Train, 'NumNeighbors', 5, 'Standardize', 1);
label = KNN.predict(low_fea_Test);
acc = sum(gnd_Test == label) / N;
fprintf('dimension: %d     acc: %f\n', dimension, acc);
% 6. Recover face images form low dimensional space, visualize them
back_fea_Train = low_fea_Train * pc_Train';
figure;
show_face(back_fea_Train);