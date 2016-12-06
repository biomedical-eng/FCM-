function [I2,I3]=defuzzy(U1,I,V2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���룺�����Ⱦ���U1��ԭʼͼ��I
%�����������ǵľ���I2�ͷָ���ͼ��I3
%���ܣ������Ǿ���ͷָ���ͼ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(I);
I2=zeros(m,n);

c = size(U1{1,1},1);
I3 = zeros(m,n);
I2 = I3;

[b q] = sort(V2);

for i=1:m
    for j=1:n
        [A,index]=max(U1{i,j});
        %I2(i,j)=index;
        
        I2(i,j)=c-q(index)+1;
        
        I3(i,j)=255*(c-I2(i,j))/(c-1);
    end
end

