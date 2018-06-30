function [bbx UI] = ir_select_bbx(IMS, imgid)

%function bbx = ir_select_bbx(IMS, imgid)
%  displays image with id imgid
%  allows to select a bounding box by mouse
%  returns the selected bounding box after clicking the button
%
% (C) Michal Perdoch 2009

% initialise layout
UI.fig  = figure('units', 'normalized', 'toolbar', 'none', 'menubar', 'none', 'Name', IMS.Names{imgid}, 'numbertitle','off');
UI.handles(1) = axes('position', [0 0 1 0.9], 'parent', UI.fig);
UI.handles(2) = uicontrol('units', 'normalized', 'parent', UI.fig, 'callback', 'uiresume(gcbf)', 'position', [0.4 0.91 0.2 0.08], 'string', 'Search!', 'style', 'pushbutton');
fname = sprintf('%s%s%s%s', IMS.dir, filesep, IMS.Names{imgid}, IMS.ext);
im = imread(fname);
imshow(im, 'parent', UI.handles(1));
try
   h = imrect('PositionConstraintFcn', makeConstrainToRectFcn('imrect',[0 size(im,2)], [0, size(im,1)]));
   uiwait(UI.fig);
   bbx = h.getPosition;
   bbx(3:4) = bbx(3:4)+bbx(1:2);
   bbx = bbx .* [IMS.imgs_size(imgid,:) IMS.imgs_size(imgid,:)]./[size(im,2) size(im,1) size(im,2) size(im,1)];
catch
   bbx = [0 0 IMS.imgs_size(imgid,:)];
end;
