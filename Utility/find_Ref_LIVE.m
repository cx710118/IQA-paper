function ref_ind_live=find_Ref_LIVE(refnames_all)
     %�˺���ֻ�ǽ�ÿ��ʧ��ͼ���ҵ����Ӧ�Ĳο�ͼ��� ��������ʱ���ݱ�Ž��л��֣�
     %����80%�Ĳο�ͼ��������ʧ��ͼ������ѵ�������µ����ڲ���...��
     %�˻��ַ�ʽ��ʹѵ�������Ͳ�������û���غϵ�ͼ��
     
    refimgnames=unique(refnames_all);
    refimgnum=length(refimgnames);
    refimg_index=zeros(779,1);
    
    for i=1:refimgnum
       ref=refimgnames{i};
       [~,ind]=find(strcmp(refnames_all,ref));
       refimg_index(ind)=i;   
    end
    ref_ind_live=refimg_index;
      
end