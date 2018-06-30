function DB = ir_createdb(IMS, word_weights)

% function DB = ir_createdb(IMS, word_weights)
% 
% input:
% IMS - the IMS structure
% word_weights - an array of number_of_visual_words, weight of
%              visual word is word_weights(id)
%
% output:
% DB - sparse matrix num_images x number_of_visual_words
%      weighted by word_weights, columns normalized to length 1
%

N = length(IMS.lbls);
ims = length(IMS.Ind)-1;
c = zeros(N, 1);

for i = 1 : ims
   st = IMS.Ind(i);
   en = IMS.Ind(i+1)-1;
   c(st:en) = i;
end

X = sparse(double(IMS.lbls), c, word_weights(IMS.lbls), IMS.nclus, ims);
inv_lens = 1 ./ sqrt(full(sum(X.^2)));
clear X;
DB = sparse(c, double(IMS.lbls), word_weights(IMS.lbls) .* inv_lens(c), ims, IMS.nclus);
