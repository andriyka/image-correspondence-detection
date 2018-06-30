function hash = mh_minhashW(weight)

%function hash = mh_minhashW(weight)
%
% weight is Nx1 vector of word weights
% generates hash values / permutation of N words
% for details see Chum et. al: Near Duplicate Image Detection:
%                              min-Hash and tf-idf Weighting, BMVC'08
% (c) Ondrej Chum 2008


len = length(weight);
hash = zeros(len,1,'uint32');

weight(weight < eps) = eps;

rval = rand(len,1);
rval = log(rval) ./ weight(:);
[foo, ord] = sort(-rval);
hash(ord) = [1:len];