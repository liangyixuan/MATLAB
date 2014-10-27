% TFORM由maketform函数获得，TFORM = maketform(transformtype,Matrix);
% transformtype指定了变换的类型，
% 'affine'为二维或多维仿射变换(平移，拉伸，旋转，比例，错切)。Matrix为为相应的变换矩阵。
A = imread('lenna.jpg');
[height,width,dim] = size(A);
tform = maketform('affine',[-1 0 0;0 1 0;width 0 1]);
tform2 = maketform('affine',[1 0 0;0 -1 0;height 0 1]);
%定义水平镜像变换矩阵
B = imtransform(A,tform,'nearest');
%定义竖直镜像变换矩阵
C = imtransform(A,tform2,'nearest');
 
subplot(1,3,1);imshow(A);title('原图');
subplot(1,3,2);imshow(B);title('水平镜像');
subplot(1,3,3);imshow(C);title('竖直镜像');
