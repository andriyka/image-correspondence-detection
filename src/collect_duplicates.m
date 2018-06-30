function [list, val, cnt] = collect_duplicates(values)

% function [list, val, cnt] = collect_duplicates(values)
%
% input: VALUES is NxM matrix
% output: LIST is a cell array of 1D vectors, each vector
%         LIST{i} contains row indicies into VALUES
%         so that VALUES(LIST{i},:) == VAL(i,:)
%         CNT(i) = length(LIST{i});

if isempty(values)
   list = {};
   val = [];
   cnt = [];
   return;
end

[sval, ord] = sortrows(values);

v = [ones(1,size(sval,2));diff(sval)] ~= 0;
df = sum(v,2) > 0;

val = sval(df,:);
num = cumsum([df;1]);
cnt = diff([find(df);length(values)+1]);
pos = cumsum([1;cnt]);
dup = find(cnt > 1);

if isempty(dup)
   list = {};
   val = [];
   cnt = [];
   return;
end

for i = 1:length(dup)
  j = dup(i);
  list{i} = ord(pos(j):pos(j+1)-1);
end

val = val(dup,:);
cnt = cnt(dup);