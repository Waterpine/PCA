function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation
% filename = '5.gif';
img_r = double(imread(filename));
img_r = img_r / 255;

[x, y] = find(img_r ~= 1);
pts = [x,y];
data = zeros(1, length(x));
for i = 1: length(x)
    data(i) = img_r(x(i),y(i));
end

% YOUR CODE HERE
[eigenvector, ~] = pca(pts);
pc = eigenvector;
pc(:,2) = -pc(:,2); 
pts = pts * pc;
pts1 = round(pts);
min_ = min(pts1);
pts1(:,1) = pts1(:,1) - min_(1) + 1;
pts1(:,2) = pts1(:,2) - min_(2) + 1;
max_ = max(pts1);
img = ones(max_(1),max_(2));
for i = 1: length(x)
    img(pts1(i,1),pts1(i,2)) = data(i);
end
if max_(1) > max_(2)
    img = img';
end

end