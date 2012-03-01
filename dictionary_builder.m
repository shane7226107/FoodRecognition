%%
function dictionary_builder

%Loading all the descriptors from each image patch and combine them into a
%single matrix.
files = dir('../extractedDescriptors/*.mat');
num_files = numel(files);
descriptors = cell(1, num_files);

image_set_descriptor = [];


for k = 1:num_files
    tempPath = ['../extractedDescriptors/' files(k).name];
    load(tempPath);   
    
    sprintf('combining image %g : %s  ''s descriptor into a single matrix' , k ,files(k).name)  
    
    
    image_set_descriptor = [image_set_descriptor total_descriptor];   
    
end

%save the big matrix"image_set_descriptor "
save('../image_set_descriptor.mat','image_set_descriptor');

%demo_fast_sc.....
demo_fast_sc(2);
 
