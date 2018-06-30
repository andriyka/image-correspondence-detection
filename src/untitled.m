% load("imagedb.mat");
% 
% weight = word_weights(IMS);
% DB = ir_createdb(IMS, weight);
% 
% lbls = ir_imagedata(69, IMS);
% 
% [imgs, score] = ir_query(DB, lbls, weight);
% 
% ir_show_results(IMS, imgs(1:10))
% 
% [qlbls, qgeom] = ir_imagedata(69, IMS);
% topN = imgs(1:100);
% 
% topN_scores = ones(1, numel(topN));
% 
% [out1, qidx] = sort(qlbls);
% for im= 1:numel(topN)
%    
%     [im_lbls, im_geom] = ir_imagedata(topN(im), IMS);
%     [out2, ridx] = sort(im_lbls);
%     [af, im_sc] = affinem2m(qlbls(qidx), qgeom(:,qidx), im_lbls(ridx), ir_invgeom(im_geom(:,ridx)));
%     topN_scores(im) = im_sc;
% end
% [out, idx_final] = sort(topN_scores, 'descend');
% ims_fin = topN(idx_final);
ir_show_results(IMS, topN(1:20))
ir_show_results(IMS, ims_fin(1:20))



