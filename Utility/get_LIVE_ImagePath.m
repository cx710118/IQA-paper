function  image_path  = get_LIVE_ImagePath( Data_Dir ,image_path)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
subDir=fullfile(Data_Dir,'jp2k');
subDir_File = dir(fullfile(subDir, '*.bmp'));
for i=1:length(subDir_File)
    image_path=[image_path ; strcat(subDir,'\img',num2str(i),'.bmp')];
end

subDir=fullfile(Data_Dir,'jpeg');
subDir_File = dir(fullfile(subDir, '*.bmp'));
for i=1:length(subDir_File)
    image_path=[image_path  ; strcat(subDir,'\img',num2str(i),'.bmp')];
end

subDir=fullfile(Data_Dir,'wn');
subDir_File = dir(fullfile(subDir, '*.bmp'));
for i=1:length(subDir_File)
    image_path=[image_path ; strcat(subDir,'\img',num2str(i),'.bmp')];
end

subDir=fullfile(Data_Dir,'gblur');
subDir_File = dir(fullfile(subDir, '*.bmp'));
for i=1:length(subDir_File)
    image_path=[image_path ; strcat(subDir,'\img',num2str(i),'.bmp')];
end

subDir=fullfile(Data_Dir,'fastfading');
subDir_File = dir(fullfile(subDir, '*.bmp'));
for i=1:length(subDir_File)
    image_path=[image_path ; strcat(subDir,'\img',num2str(i),'.bmp')];
end

end

