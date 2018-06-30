function geom = ir_geom_transA (A, geom)

%function geom = ir_geom_transA (A, geom)
%  transforms features' geometry geom by an affine 
%  transformation A
%
%  (C) Ondra Chum 2009

  sx = geom(1,:);
  sy = geom(2,:);
  s1 = geom(3,:);
  s2 = geom(4,:);
  s3 = geom(5,:);

  a = A(1,1);
  b = A(1,2);
  c = A(2,1);
  d = A(2,2);
  tx = A(1,3);
  ty = A(2,3);


  b2 = b*b;
  a2 = a*a;
  ab = a*b;
  bd = b*d;
  bc = b*c;
  ac = a*c;
  ad = a*d;
  ad_bc = ad - bc;

  geom(1,:) = a*sx + b*sy + tx;
  geom(2,:) = c*sx + d*sy + ty;
  geom(3,:) = sqrt(b2*s3.*s3 + b2*s2.*s2 + 2*ab*s1.*s2 + a2*s1.*s1);
  geom(5,:) = (ad_bc * s1 .* s3) ./ geom(3,:);
  geom(4,:) = (bd* (s3.*s3 +s2.*s2) + (bc + ad)*s1.*s2 + ac*s1.*s1) ./ geom(3,:);
  
