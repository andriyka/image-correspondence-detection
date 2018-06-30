% how many min_hashes per sketch
sketch_size = 3;
k = 10;

if ~exist('weight')
  % all visual words have the same weight - standard min-Hash (for now)
  weight = ones(max(IMS.lbls),1);
end

clear hash;
c = [];
for j = 1:k
    
for i = 1:sketch_size
  % generate the hash function / permutation of visual words
  hash(:,i) = mh_minhashW(weight);
end

% for each document select the minimal element
sketch = mh_sketch(IMS.Ind, IMS.lbls, hash);
    

% find documents with colliding sketches
[collisions, keys, cnt] = collect_duplicates(sketch);
c = cat(2, c, collisions);
end

max_size = max(cellfun(@numel, c));
for ci=c
    size = numel(ci);
    for ll = 1: max_size - size
        ci{ll} = ci{size};
    end
end
res = unionfind(c);

close all;

% each figure shows images having the same sketch
for i = 1:length(res)
  ir_show_results(IMS, res{i});
end