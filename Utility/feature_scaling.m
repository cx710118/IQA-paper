function SVFM = feature_scaling(VecFeaMat)
% Input:  VecFeaMat --- ��Ҫscaling�� m*n ά���ݾ���ÿ��һ��������������������Ϊά��
%
% output: SVFM --- VecFeaMat�� scaling �汾

% ����Ŀ�귶Χ[-1, 1]
lTargB = -1;
uTargB = 1;


[m n] = size(VecFeaMat);

SVFM = zeros(m, n);

% %������һ��-(��ֵ-����)
% u=mean(x,1); %��ÿ�����
% sagma=std(x,1,1); %���з֣��ڶ�λ��0-(��n-1);1(��n)
% for i=1:sample_num
%     x(i,:)=(x(i,:)-u)./sagma;
% end

%% ������һ��-(min-max)
max_row=max(VecFeaMat,[],1);
min_row=min(VecFeaMat,[],1);
for i=1:m;
    SVFM(i,:)=(VecFeaMat(i,:)-min_row)./(max_row-min_row)*(1-(-1))+(-1); %��ֵ���
end

