
clc;
clear all;
close all;

delete feat_data/*.mat
tic;

%----------------------- color_lbp----------------------------%%
alg_type='color_lbp';
feat_num=(10+2)*3+10; %
is_feature_scale=true;
is_srocc_search=false;
%% ��ȡ����   
imdb = Get_LIVE_Data(alg_type,feat_num);
%% ���
result=Get_LIVE_Result(alg_type,is_feature_scale,is_srocc_search)


%% ������
runtime=toc;
result.runtime=runtime/3600;
result.feat_num=feat_num;
save(sprintf('Result/LIVE_%s_%d_featnum_%d_result_ALL.mat',alg_type,is_srocc_search,feat_num),'result');


