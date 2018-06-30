function idxin = ir_ptsinbb(pos, rect)

%function idxin = ir_ptsinbb(pos, rect)
%  returns indicies to points pos (2xn) that are
%  inside the rectangle [x_min y_min x_max y_max]
%
%  (C) Ondra Chum 2009

len = size(pos,2);

inside = (pos(1,:) >= rect(1)) & (pos(1,:) <= rect(3)) & ...
         (pos(2,:) >= rect(2)) & (pos(2,:) <= rect(4));

idxin = find(inside);