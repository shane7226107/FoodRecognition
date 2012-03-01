function out  = LBP(I2, SIFT_location);
%I=imread('0001.jpeg');
%figure,imshow(I)   

%% Crop    

%I2 = imcrop(I);   
%I2 = rgb2gray(I);
%figure, imshow(I2) 
w=size(I2,1);     
h=size(I2,2);  


%% SIFT POINT
%SIFT_p = [15 19 21; 22 34 10];
point_num = size(SIFT_location, 2);
LBP_descriptor = zeros(256, point_num);


%% LBP    
A = zeros(w,h);
    
for i=2:w-1     
    for j=2:h-1    
         J0=I2(i,j);   
         I3(i-1,j-1)=I2(i-1,j-1)>J0;  
         I3(i-1,j)=I2(i-1,j)>J0;   
         I3(i-1,j+1)=I2(i-1,j+1)>J0;  
         I3(i,j+1)=I2(i,j+1)>J0;     
         I3(i+1,j+1)=I2(i+1,j+1)>J0;    
         I3(i+1,j)=I2(i+1,j)>J0;      
         I3(i+1,j-1)=I2(i+1,j-1)>J0;     
         I3(i,j-1)=I2(i,j-1)>J0;       
         A(i,j)=I3(i-1,j-1)*2^7+I3(i-1,j)*2^6+I3(i-1,j+1)*2^5+I3(i,j+1)*2^4+I3(i+1,j+1)*2^3+I3(i+1,j)*2^2+I3(i+1,j-1)*2^1+I3(i,j-1)*2^0;
    end  
end
A = uint8(A);


%% FOR EACH SIFT POINT

for i = 1:point_num
	x = round(SIFT_location(1,i));
	y = round(SIFT_location(2,i));
	
	for u = x-4:x+4
		for v = y-4:y+4
			index = A(u,v)+1;
			LBP_descriptor(index, i) = LBP_descriptor(index, i)+1;
		end;
	end;
end;

out = LBP_descriptor;

%figure,imshow(A);
%figure,imhist(A) ;
end