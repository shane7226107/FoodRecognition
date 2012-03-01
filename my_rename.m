clear all;

file_name_list = dir;

count = size(file_name_list, 1);
buf_er = 0;

for i=1:count
	if strfind(file_name_list(i).name, 'jpg') > 0,
		name = sprintf('sushi_%03d.jpg',i-buf_er);
		movefile(file_name_list(i).name, name);
	else
		buf_er = buf_er+1;
	end;
end;