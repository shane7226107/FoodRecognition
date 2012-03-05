function [ output_args ] = my_represent( input_args )
%MY_REPRESENT Summary of this function goes here
%   Detailed explanation goes here

load ../dictionary basis.mat;
load ../extractedDescriptors/test.mat;

Xout = l1ls_featuresign (dictionary_basis, test, 1);

end

