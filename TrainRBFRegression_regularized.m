function [w]=TrainRBFRegression_regularized(z,P,C,sig,lambda)
% Given z (array of pixel colors which correspond to points in P), P (a
% matrix consisting of columns which represent coordinates of pixels in an
% image), C (coordinates for the centers of RBF), sig (the width of
% RBF centers), and lambda (a regularization value between 0 and 0.5)
% compute the weights for RBF regression on a set of pixel 
% values from an image patch. The goal is to fit a model to the pattern
% of image brightness in the patch so we can use it
% for inpainting and denoising

% for each degree up to K, evaluate rbf for each C column
adder = 1;
% fill up first column of X with 1 for bias term
X = ones(size(P,2), 1);
% get K array which has the number of columns of C
K = size(C, 2);
while adder <= K
    % fill in next column of X with C's #adder column evaluated in Radial 
    % Basis Function 
    X = [X rbf2d(P,C(:,adder),sig)];
    % add one to adder to go to next column
    adder = adder + 1;
end
% create identity matrix of size X and
I = eye(size(X));
% multiply each element by lambda
X = X+I.*lambda;
% calculate weights
w = X\z;