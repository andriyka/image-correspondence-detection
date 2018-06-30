function [sets, cnt] = unionfind(insets)

% function [sets, cnt] = unionfind(insets)
%
% input: INSETS is a cell array of 1D column vectors
%        each representing a set
% output: SETS is a cell array of disjoint sets such that:
%         1) each output set is a union of some input sets
%            that have non-empty non-empty intersection
%         2) each input set is a subset of one of the output
%            sets
%         CNT(i) = length(SETS{i});

len = length(insets);
data = [insets{:}];
[original_val, foo, new_val] = unique(data(:));

maxval = length(original_val);

tree = ones(maxval,1) + maxval;

track = zeros(1000,1);

st = 1;
for link = 1:len

  en = st+length(insets{link})-1;
  val = new_val(st:en);
  st = en+1;

  i = 0;
  grp = maxval + 1;
  for j = 1:length(val)
    a = val(j);
    while (tree(a) < maxval) & (tree(a) ~= a)
      i = i + 1;
      track(i) = a;
      a = tree(a);
    end
    i = i + 1;
    track(i) = a;
    grp = min(grp, tree(a));
  end
  if grp == maxval+1
     grp = min(val);
  end
  tree([val; track(1:i)]) = grp;
end

sel = find(tree(tree) ~= tree);
tree = tree_collapse(tree, sel);

[sets, grp, cnt] = collect_duplicates(tree);
for i = 1:length(sets)
  sets{i} = original_val(sets{i});
end
[cnt, ord] = sort(cnt,'descend');
sets = sets(ord);


function tree = tree_collapse(tree, sel)

  tree(sel) = tree(tree(sel));
  sel_new = sel(tree(sel) ~= tree(tree(sel)));
  if ~isempty(sel_new)
     tree = tree_collapse(tree, sel_new);
  end

