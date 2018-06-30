% show images with id 1 to 20
imagelist = [1:20];
ir_show_results(IMS, imagelist);

fprintf('Showing a list of images. Press any key to continue\n');
pause
close

%select a rectangle in image id 101
imageid = 101;
fprintf('Select a rectangle and click ''Search''...\n')
[bbx, UI] = ir_select_bbx(IMS, imageid);

%show features inside the boundig box
[lbls, geom] = ir_imagedata(imageid, IMS);
close;

%show the image
ir_showim(IMS, imageid);
hold on;

%show features with the center inside the rectangle
sel = ir_ptsinbb(geom(1:2,:), bbx);
drawell(geom(:,sel));
fprintf('Features (ellipses) with centers inside the rectangle...\n');
