function [A, ninl] = affinem2m (qlbls, qgeom, rlbls, rgeom, thr)
%function [A, ninl] = affinem2m (qlbls, qgeom, rlbls, rgeom, thr)
%
%  robust estimation of affine transformation from many to many ellipse matches
%  assumes the gravity vector is (approximately) preserved
%
%  in:
%   qlbls - int32 vector of visual words (length N), sorted in ascending order
%   qgeom - single 5xN, each column [x y o p q]'
%           matrix [o 0;
%                   p q] transforms ellipse to a unit circle
%     i-th feature is assigned to visual word qlbls[i] and
%          located at qgeom(:,i)     
%   rlbls - int32 vector of visual words (length M), sorted in ascending order
%   rgeom - single 5xM, each column [x y a b c]
%           matrix [a 0;
%                   b c] transforms a unit circle to an ellipse
%   thr - inlier distance threshold sqrt(d_img1 ^ 2 + d_img2 ^ 2) [default 40]
%
%  out:
%   A - 3x3 transformation matrix
%   ninl - matching score (number of inliers)
