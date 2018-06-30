function weights = word_weights(IMS)
%WORD_WEIGHTS Summary of this function goes here
%   Detailed explanation goes here

weights = zeros(1, IMS.nclus);
num_vw = IMS.Ind(2: end) - IMS.Ind(1: end - 1);
for k = 1:numel(num_vw)
    uvw = unique(IMS.lbls(IMS.Ind(k):IMS.Ind(k+1) - 1));
    weights(uvw) = weights(uvw) + 1;
end
weights = log((numel(IMS.Ind) - 1) ./ weights);
weights(isinf(weights)) = 0;


    

