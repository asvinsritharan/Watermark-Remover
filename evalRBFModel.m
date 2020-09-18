function [z]=evalRBFModel(w,P,C,sigma)
% This function evaluates the radial basis functions model with weights
% calculated from TrainRBFRegression.m

% w are the weights that are estimated for the radial basis functions from
% the model made by TrainRBFRegression.m
% P is an array made of 2 rows where each column has the coordinates of
% points where the model is to be evaluated at
% C is an array made of 2 rows where each column has the coordinates of the
% centers of the radial basis functions
% sigma is the width of the radial basis functions

%Get the 
% Create X matrix by evaluating rbf for each column in C
% loop variable
adder = 1;
% Create empty array with same length as columns in P for the first column
% in regression matrix to be filled with 1s
X = ones(size(P,2), 1);
% Let K be the number of columns in C
K = size(C, 2);
% while the loop variable is less than or equal to the number of cols in C
while adder <= K
    % calculate next column of X matrix to be the value of P and C after it
    % has been evaluated in the Radial Basis Function
    X = [X rbf2d(P,C(:,adder),sigma)];
    % add one to adder to go to next column
    adder = adder + 1;
end
% get z by multiplying X matrix to given weights
z=X*w;