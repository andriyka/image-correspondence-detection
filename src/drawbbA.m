function h = drawbbA(bb, A, varargin)

l = size(bb,1);
h = [];
for i = 1:l
  pt = [bb(i,[1,3,3,1,1]);bb(i,[2,2,4,4,2])];
  pt(3,:) = 1;
  pt = A * pt;
  pt(1,:) = pt(1,:) ./ pt(3,:);
  pt(2,:) = pt(2,:) ./ pt(3,:);

  if length(varargin) == 0
    h = [h,plot(pt(1,:), pt(2,:),'r-','linewidth',3)];    
  else  
    h = [h,plot(pt(1,:), pt(2,:),varargin{:})];
  end
end