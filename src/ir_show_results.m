function UI = ir_show_results(IMS, imgid_list, opt_bbx, opt_trans_list)

% function ir_show_results(IMS, imgid_list)
%   shows images from IMS structure with indicies imgid_list
%
% ir_show_results(IMS, imgid_list, opt_bbx, opt_trans_list)
%   draws a bounding box opt_bbx (1x4) transformed by corresponding
%   affine transformation opt_trans_list (cell array, each element 3x3 matrix)
%
% (C) Michal Perdoch 2009 


num_per_page = 20;
%columns = 5;

% initialise layout
UI.fig  = figure('units', 'normalized', 'toolbar', 'none', 'menubar', 'none', 'Name', 'Results', 'numbertitle','off');
if exist('columns')
   UI.c = columns;
else
   UI.c = ceil(sqrt(num_per_page));
end;
UI.r = ceil(num_per_page/UI.c);
UI.num = min(num_per_page, length(imgid_list));
UI.handles = zeros(1,UI.num);

for id=0:length(imgid_list)-1
   j = floor(id / UI.c);
   i = id - j*UI.c;
   UI.handles(id+1) = axes('position', [i/UI.c+0.005 1-(j+1)/UI.r+0.005 1/UI.c-0.01 1/UI.r-0.05], 'parent', UI.fig);
end;

for i=1:length(imgid_list)
   id = imgid_list(i);
   fname = sprintf('%s%s%s%s', 'oxbuild_images', filesep, IMS.Names{id}, IMS.ext);
   % compute number of features in sectors
   im = imread(fname);
   sz = size(im)/4;
   cla(UI.handles(i)); 
   imshow(im, 'parent', UI.handles(i)); hold(UI.handles(i),'on');
   title(UI.handles(i), sprintf('%s', IMS.Names{id}), 'interpreter', 'none','color', 'r')
   if (exist('opt_bbx'))
      sc = diag([[size(im,2) size(im,1)]./IMS.imgs_size(id,:) 1]);
      tr = opt_trans_list{i};
      drawbbA(opt_bbx, sc* tr, 'parent', UI.handles(i), 'linewidth', 2, 'color', [0.8 0.4 0]);
   end;
end;
zoom(UI.fig, 'on');