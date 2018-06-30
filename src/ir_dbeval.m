%this script runs evaluation on 55 queries
% you only need to insert your search code

mAP = 0;

for query_id = 1 : 55

  query_image_id = QUERIES(query_id).image_id;
  bbx = QUERIES(query_id).bbx;

  [qlbls, qgeom] = ir_imagedata(query_image_id, IMS);
  inside = ir_ptsinbb(qgeom(1:2,:), bbx);
  qlbls = qlbls(inside);
  qgeom = qgeom(:,inside); 


% ----- YOUR RETRIEVAL HERE -----
% store list of image ids in R 
 
 R = randperm(5062); %retrieval by chance :)


% evaluation scpirp continues......

  AP = ir_evaluate(query_id, R);

  fprintf('%s %.2f\n', QUERIES(query_id).Name, AP);

  mAP = mAP + AP;

end

mAP = mAP / 55;
fprintf('\n Mean AP: %.2f\n,mAP);

