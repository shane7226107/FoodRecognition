function [POS  DES] = mysift( IMAGE )
%MYDATA Summary of this function goes here
%   Detailed explanation goes here
addpath sift
row = size(IMAGE,1);
column = size(IMAGE,2);


count = 0;

% 	[locs descriptor] = sift(this_Image);
% 	
DES = [];
POS = [];
for x = 1:floor(row / 8) -2
	for y = 1:floor(column / 8) -2
		[locs descriptor] = sift(IMAGE(1+x*8:(x+2)*8,1+y*8:(y+2)*8));
		locs(1,:) = locs(1,:) + x*8;
		locs(2,:) = locs(2,:) + y*8;
		if isempty(POS)	
			POS = locs;
			DES = descriptor;
		elseif ~isempty(locs)
			POS = cat(2,POS,locs);
			DES = cat(2,DES,descriptor);
		end
		count = count + size(locs,2);
	end
end
POS = POS(1:2,:);
disp({count 'features'});
end



