%Assignment Feb 15, Bhuvan Mittal, Steve Wang

close all
clear variables
clc

trainImages = imageDatastore('rose512.tif', 'IncludeSubfolders', true,...
    'LabelSource', 'foldernames');

numTrainImages = numel(trainImages.Labels);
idx = randperm(numTrainImages,1);
figure
for i = 1:1
    subplot(1,1,i);
    f = readimage(trainImages,idx(i));
    imshow(f);
end
snake_manual_input(f,100,'g');


%end % function validstring