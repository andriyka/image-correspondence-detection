function sketch = mh_sketch(Ind, lbl, hash)

% sketch = mh_sketch(Ind, lbl, hash)
%
% mh_sketch selects minimal elements for each of length(Ind)-1 documents
% with respect to the hash values
%
% hash is a NxS matrix, where N is the number of visual words
%      N >= max(lbl) and S is the size of the sketch

nclus = size(hash,1);
ndoc = length(Ind)-1;
nsk = size(hash,2);

sketch = zeros(ndoc, nsk, 'uint32');

for i = 1:nsk
  for doc = 1:ndoc
    if Ind(doc+1) > Ind(doc)
      sketch(doc, i) = min(hash(lbl(Ind(doc):Ind(doc+1)-1),i));
    end
  end
end
