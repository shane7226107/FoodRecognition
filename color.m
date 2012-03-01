function ColorMatrix = color(Image,SIFT_location)
Img=Image;
for i = 1:size(SIFT_location,2) 
%patch
x = floor(SIFT_location(1,i));
y = floor(SIFT_location(2,i));
patch = Img(x-4:x+3, y-4:y+3,:);
HSVImg = rgb2hsv(patch);
%imshow(patch);
for j = 1:3
% RGB mean std
ColorMatrix(j,i)= mean2(patch(:,:,j));
ColorMatrix(j+3,i)= std2(patch(:,:,j));
% HSV mean std
ColorMatrix(j+6,i)= mean2(HSVImg(:,:,j));
ColorMatrix(j+9,i)= std2(HSVImg(:,:,j));
end
      
end
