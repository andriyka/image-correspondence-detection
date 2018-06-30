function [h UI] = ir_showim(IMS, imgid)

UI.fig  = figure('units', 'normalized', 'toolbar', 'none', 'menubar', 'none', 'Name', IMS.Names{imgid}, 'numbertitle','off');
UI.handles(1) = axes('position', [0 0 1 1], 'parent', UI.fig);
fname = sprintf('%s%s%s%s', 'oxbuild_images', filesep, IMS.Names{imgid}, IMS.ext);
im = imread(fname);
UI.img = image([1 IMS.imgs_size(imgid, 1)], [1 IMS.imgs_size(imgid, 2)], im, 'parent', UI.handles(1));
axis(UI.handles(1),'off'); axis(UI.handles(1),'image');
h = UI.fig;