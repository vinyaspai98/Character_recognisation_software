clc;clear all;close all;
list=dir('G:\MATLAB\course_project\EnglishFnt\English\Fnt');
for k=1:length(list),
    if (list(k).name~='.' & list(k).name~='..'),
        st=strcat(list(k).folder,'\',list(k).name);
        list1=dir(st);
        filename=strcat('G:\rgb','\',list(k).name);
        mkdir ('G:\rgb', list(k).name);
        for j=3:length(list1),
                image_name=strcat(list1(j).folder,'\',list1(j).name);
                disp(image_name);
                i=imread(image_name);
                rgb=cat(3,i,i,i);
                root=strcat(filename,'\',list1(j).name);
                imwrite(rgb,root);
        end
    end
    
end
%i=imread('G:\MATLAB\course_project\EnglishFnt\English\Fnt\0\img001-00001.png');
%rgb = cat(3,i,i,i);
%imwrite(rgb,root);