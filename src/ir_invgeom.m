function geom = ir_invgeom(geom)

%function geom = ir_invgeom(geom)
%  inverts transforms in geom
%  geom (5xN) ... [x y a b c]
%  the affine transform
%  [ a 0 ]
%  [ b c ]
%
%  (C) Ondra Chum 2009

if ~isempty(geom)
  geom(3,:) = 1./geom(3,:);
  geom(5,:) = 1./geom(5,:);
  geom(4,:) = -geom(4,:) .* geom(3,:) .* geom(5,:);
end
