%clc;clear all;close all;
list=dir('G:\New folder');
for k=3:length(list),
        st=strcat(list(k).folder,'\',list(k).name);
        root=strcat('G:\New folder','\',list(k).name);
        disp(st);
        i=imread(st);
        rgb=cat(3,i,i,i);
        imwrite(rgb,root);
end



rootFolder = 'G:\New folder';
imds_test = imageDatastore(rootFolder, ...
    'LabelSource', 'foldernames');
llist=[];
inputSize1 = [32 32];
imds_test.ReadFcn = @(imds_test)imresize(imread(imds_test),inputSize1);

labels = classify(net, imds_test);

for kk=1:length(imds_test.Files),
im = imread(imds_test.Files{kk});

figure,imshow(im);
stri=char(labels(kk));
stri=stri(1);
    
llist=strcat(llist,'',stri);
end
disp(llist);