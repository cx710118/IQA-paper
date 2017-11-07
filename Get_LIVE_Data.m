
function imdb_LIVE=Get_LIVE_Data(alg_type,feat_num)

addpath('Utility/');
Data_Dir = 'F:/RANJIEWEN/IQA/IQA����/code/dataSet/LIVE'    %'dataSet/LIVE'; % F:\RANJIEWEN\IQA\IQA����\code\dataSet

dmos_new_live_path= fullfile(Data_Dir,'dmos_realigned.mat');
ref_live_path=fullfile(Data_Dir,'refnames_all.mat');

load(dmos_new_live_path);
load(ref_live_path);

%% ��ȡ dmos_new_live��ind_live��ref_ind_live
dmos_new=dmos_new';
orgs=orgs';
% 982��ȥ���ο�ͼ��õ�779
index=[];
for i=1:length(orgs')
    if orgs(i)==0
        index=[index;i];
    end;
end
refnames_all=refnames_all(:,index);

dmos_new_live=dmos_new;
ind_live=~orgs;
ref_ind_live=find_Ref_LIVE(refnames_all);

%% ��˳���ÿ��ͼ��·��
image_path_live={};
image_path_live=get_LIVE_ImagePath(Data_Dir,image_path_live);
image_distortion_type=get_LIVE_distortion_type();
if ~exist('Result/LIVE_dist_type.mat','file')
    save('Result/LIVE_dist_type.mat','image_distortion_type');
end

imdb_LIVE.dmos_new_live=dmos_new_live;
imdb_LIVE.ind_live=ind_live;
imdb_LIVE.ref_ind_live=ref_ind_live;
imdb_LIVE.image_path_live=image_path_live;

if ~exist('Result/LIVE_image_path.mat','file')
    save('Result/LIVE_image_path.mat','image_path_live');
end

%% �鿴�����㷨�����Ƿ���ڣ�����������ȡһ��
if ~exist(sprintf('Result/LIVE_%s_data.mat',alg_type))
    
    num_image=size(image_path_live,1);
    feat_mat=zeros(num_image,feat_num);
    
    for k=1:num_image
        im=imread(image_path_live{k});
        if exist(sprintf('feat_data/feature_%d.mat',k))
            load(sprintf('feat_data/feature_%d.mat',k));
        else
            % ͬһ�����ݿ��룬���ò�ͬ�㷨�� im���룬�㷨�ڲ�ת����ʽ��
            switch alg_type
               
                case 'color_lbp';
             
                    feature = feat_extract_all(im); %
               
                otherwise
                    disp('algorithm type error...');
            end
            feat_mat(k,:) = feature;
            save(sprintf('feat_data/feature_%d.mat',k),'feature');
        end
        fprintf('extract %s feat %d...\n',alg_type, k);
    end;
    disp('extract feature finished.....');
    live_feature=feat_mat;
    imdb_LIVE.live_feature=live_feature;
    save(sprintf('Result/LIVE_%s_data.mat',alg_type),'dmos_new_live','ind_live','ref_ind_live','live_feature','refnames_all');
    
end

end


