function [y]=rbf2d(p,c,sigma)
 % This script represents the computation of an radial basis function given
 % p (the coordinates of points where the radial basis function is to be
 % calculated), c (the centers of the rbf), sigma (the width of the rbf
 % centers). The result, y, is the y value for radial basis function
 
 % Compute the difference between each p_i and the RBF center
 d=p-repmat(c,[1 size(p,2)]);
 % Compute squared distance from each p_i to center
 d=sum(d'.^2,2);
 % Evaluate the RBF
 y=exp(-d./(2*sigma*sigma));	
 
return;
