function hell = drawell(geom)

%DRAWELL(geom)
%draws ellipses into an image, geom = (x y a b c)'
%x,y ellipse center
%[a 0; b c] transrers unit circle to the ellipse

pos = double(geom);

circ = circ_pts(75, 0);
hell = [];

for ft = 1:size(pos,2)
   D = [pos(3,ft), 0; pos(4,ft), pos(5,ft)];
   ell = D * circ;
   ell(1,:) = ell(1,:) + pos(1, ft) + 1;
   ell(2,:) = ell(2,:) + pos(2, ft) + 1;
   hell = [hell, plot(ell(1,[1:end,1]), ell(2,[1:end,1]), 'r-')];
end

function pts = circ_pts (num, ph)

angl = [0:num-1] * (2 * pi / num) + ph;
pts = [cos(angl); sin(angl)];
