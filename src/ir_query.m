function [img_ids,score] = ir_query(DB, lbls, ww)
%IR_QUERY Summary of this function goes here
%   Detailed explanation goes here
q = sparse(double(lbls), double(ones(1, numel(lbls))), ones(1, numel(lbls)), numel(ww), 1);
q = q / norm(q);
q = ww'.*q;
score = DB * q;
[score, img_ids] = sort(score, 'descend');
end

