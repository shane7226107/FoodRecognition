%%
function descriptor_extractor

%Loading images
files = dir('trainingImages/*.jpg');
num_files = numel(files);
images = cell(1, num_files);

for k = 1:num_files
    tempPath = ['trainingImages/' files(k).name];
    images{k} = imread(tempPath);
    inputImage = double(images{k})/255; 
    inputImage_gray = rgb2gray(inputImage) ; 
    sprintf(' image %g : %s ' , k ,files(k).name)
    %SIFT    
    [SIFT_location,SIFT_descriptor] = mysift(inputImage_gray);
    disp('SIFT done');
    %LBP
    LBP_descriptor = LBP(inputImage_gray , SIFT_location);
    disp('LBP done');
    %Color
    Color_descriptor = color(inputImage , SIFT_location);
    disp('Color done');
    %combining all the descriptors
    total_descriptor = [SIFT_descriptor;LBP_descriptor;Color_descriptor];
    
    %Saving descriptor data
    filename = files(k).name;
    filename =filename(1:length(filename)-4);
    filename = ['extractedDescriptors/' filename '.mat'];
    save(filename , 'SIFT_location','SIFT_descriptor','LBP_descriptor','Color_descriptor','total_descriptor');

end


