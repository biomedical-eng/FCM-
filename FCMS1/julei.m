function [T1,T2 ] = julei( I,i,j )
%[U,V,iteration] = std_fcm(X,i,j,c)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[row1,column1]=size(I);
%if c~=1
   % a=rgb2gray(a);
%end
for(kk=1:3)
    for(kkk=1:3)
        m=i+kk-2;
        n=j+kkk-2;
  if(m<1)
    m=1;
  end
  if(m>row1)
    m=row1;
  end
  if(n<1)
    n=1;
  end
  if(n>column1)
    n=column1;
  end
       a(kk,kkk)=double(I(m,n));
    end
end
[row,column]=size(a);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 几个参数
cluster_num=4;
threshold=0.000001;
m=1.75;
iter_num=200;

%%%%%%%%%%%%%%%%%%%%%%%
% 初始化隶属度
for(i=1:row)
    for(j=1:column)
        memsum=0;
        for(k=1:cluster_num)
            membership(i,j,k)=rand();
            memsum=memsum+membership(i,j,k);
        end
        
        for(k=1:cluster_num)
            membership(i,j,k)=membership(i,j,k)/memsum;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 初始化聚类中心

for(k=1:cluster_num)
    center(k)=0;
    memsum=0;
    for(i=1:row)
        for(j=1:column)
            center(k)=center(k)+membership(i,j,k)^m *a(i,j);
            memsum=memsum+membership(i,j,k)^m;
        end
    end
    center(k)=center(k)/memsum;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 求初始距离
for (i=1:row)
    for(j=1:column)
        for(k=1:cluster_num)
            dist(i,j,k)=abs(a(i,j)-center(k));
        end
    end
end

for(i=1:iter_num)
    costfunction(i)=0.0;
end

for(i=1:row)
    for(j=1:column)
        for(k=1:cluster_num)
            costfunction(1)=costfunction(1)+membership(i,j,k)^m* dist(i,j,k)^2;
        end
    end
end

fprintf('iter.count = %d, obj. fcn = %f\n',1, costfunction(1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 开始迭代
for(it=2:iter_num)
    % 更新隶属度
    costfunction(it)=0.0;
    for(i=1:row)
        for(j=1:column)
            for(k=1:cluster_num)
                membership(i,j,k)=0;
                for(kk=1:cluster_num)
                    membership(i,j,k)=membership(i,j,k)+(dist(i,j,k)/dist(i,j,kk))^(2/(m-1));
                end
                membership(i,j,k)=1/membership(i,j,k);
            end
        end
    end     
     
        
    % 更新聚类中心
    for(k=1:cluster_num)
        center(k)=0;
        memsum=0;
        for(i=1:row)
            for(j=1:column)
                center(k)=center(k)+membership(i,j,k)^m *a(i,j);
                memsum=memsum+membership(i,j,k)^m;
            end
        end
        center(k)=center(k)/memsum;
    end  
    
    % 更新距离
    for (i=1:row)
        for(j=1:column)
            for(k=1:cluster_num)
                dist(i,j,k)=abs(a(i,j)-center(k));
            end
        end
    end
    
    % 目标函数
    for(i=1:row)
        for(j=1:column)
            for(k=1:cluster_num)
                costfunction(it)=costfunction(it)+membership(i,j,k)^m*dist(i,j,k)^2;
            end
        end
    end

    fprintf('iter.count = %d, obj. fcn = %f\n',it, costfunction(it));
    
    if abs(costfunction(it)-costfunction(it-1))<threshold
        break;
    end   
end

%输出T1与T2
for(i=1:row)
        for(j=1:column)
            T1(i,j)=membership(i,j,1);
            T2(i,j)=membership(i,j,2);
        end
end

end

