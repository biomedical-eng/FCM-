% a=imread('song.jpg');
% [row,column,c]=size(a);
% if c~=1
%     a=rgb2gray(a);
% end
% 
% a=double(a)
I=[251   255   149   243   211   212   255   255;
   255   213   250   252   255   223   244   255;
   220   255   193   220   239   255   255   254;
   255   231   255   253   254   201   255   239;
   239   251   148   254   218   252   255   252;
   255   122   255   255   255   225   248   222;
   238   254   255   247   239   255   255   252;
   255   248   255   236   251   255   249   253;
   248   206   210   253   198   245   216   243;
   255   198   241   252   230   252   255   221;
   249   219   255   229   255   196   251   254;
   255   235   254   168   255   226   255   245;
   181   242   194   216   207   252   255   250;
   175   255   244   221   255   253   205   250;
   234   233   255   252   217   248   221   176;
   245   255   204   248   255   251   254   227];
i=5;
j=5;
[T1,T2]=julei2(I,i,j);
[rowt1,columnt1]=size(T1);
for(i=1:rowt1)
        for(j=1:columnt1)
            fprintf('T1[ %d][ %d]= %d\n',i,j, T1(i,j));
        end
end
[rowt2,columnt2]=size(T2);
for(i=1:rowt2)
        for(j=1:columnt2)
            fprintf('T2[ %d][ %d]= %d\n',i,j, T2(i,j));
        end
end