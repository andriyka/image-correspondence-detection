function [ap, pr, re] = ir_evaluate(query_no, result, OXLM)

%function [ap, pr, re] = ir_evaluate(query_no, result)
%  evaluation of queries on the Oxford dataset
%  returns average precission (ap), precision (pr) and recall (re)
%  given the query_no and list of image ids in order of relevance
%
%  (C) Ondra Chum 2009

if length(result) > length(unique(result))
  error('There are repeated documents in the result...');
end

if nargin < 3
  directory = fileparts(which('ir_evaluate'));
  load([directory,'/results.mat']);
end

lm = ceil(query_no / 5);
gt = [OXLM(lm).good;OXLM(lm).ok]';
junk = OXLM(lm).junk';
junkindx = logical([ones(1,length(junk)),zeros(1,length(gt))]);

[ap, pr, re] = qe_pr(result, [1:length(result)], [junk,gt], junkindx);


function [ap, pr, re] = qe_pr(result, rrank, gt, junk)

isgt = ismember(result, gt);
result = result(isgt);
rrank = rrank(isgt);

N = sum(~junk);
gtnj = gt(~junk);

[rrank, ord] = sort(rrank);
result = result(ord);

isjunk = ismember(result, gt(junk));
subt = cumsum(isjunk);

nrank = rrank(:) - subt(:);

nres = result(~isjunk);
nrank = nrank(~isjunk);

r = length(nrank);

hp = [1:r] ./ nrank';
if r > 1
  hl(2:r) = [1:r-1] ./ (nrank(2:r)'-1);
end

if nrank(1) == 1
  hl(1) = 1;
else
  hl(1) = 0;
end

ap = sum(hp + hl) / (2 * N);

re = [[0:r-1];[1:r]] / N;
re = re(:);
pr = [hl; hp];
pr = pr(:);

rmv = (diff(re) == 0) & (diff(pr) == 0);
rmv = [0;rmv];
re = re(~rmv);
pr = pr(~rmv);


