function [lbls, geom] = ir_imagedata(image_id, IMS)

%function [lbls, geom] = ir_imagedata(image_id, IMS)
%  returns visual words (lbls) and geometry (geom) of features
%  in image with id image_id
%
%  (C) Ondra Chum 2009

st = IMS.Ind(image_id);
en = IMS.Ind(image_id+1)-1;

lbls = IMS.lbls(st:en);
geom = IMS.geom(:,st:en);
