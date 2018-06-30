function [images,top_scores] = ir_rescore(IMS,imgs, qId,rId)
%IR_RESCORE Summary of this function goes here
%   Detailed explanation goes here
[qlbls, qgeom] = ir_imagedata(qId, IMS);
topN = imgs(1:100);

top_scores = ones(1, numel(topN));

[out1, qidx] = sort(qlbls);
for im= 1:numel(topN)
    [im_lbls, im_geom] = ir_imagedata(topN(im), IMS);
    [out2, ridx] = sort(im_lbls);
    [af, im_sc] = affinem2m(qlbls(qidx), qgeom(:,qidx), im_lbls(ridx), ir_invgeom(im_geom(:,ridx)));
    top_scores(im) = im_sc;
end
[out, idx_final] = sort(top_scores, 'descend');
images = topN(idx_final);
end

