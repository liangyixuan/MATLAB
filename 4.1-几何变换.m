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

%转置旋转
tform3 = maketform('affine',[0 1 0;1 0 0;0 0 1]);
D = imtransform(A,tform3,'nearest');
figure;imshow(D);


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%采用imtransform函数实现缩放
A = imread('lenna.jpg');
[height,width,dim] = size(A);
tform = maketform('affine',[2 0 0;0 2 0;0 0 1]);
%2 0 0；0 2 0；中的2表示放大2倍。缩放矩阵为[s 0 0;0 s 0;0 0 1]
B = imtransform(A,tform,'nearest');
imshow(A);title('原图');figure;
imshow(B);title('放大2倍');

%采用imresize函数实现缩放
%格式imresize(A,scale,method); scale为缩放比例，method为插值方法，默认为最近邻插值
%若要实现x和y方向不同比例缩放，可用imresize(A,[mrows ncols],method); 
% [mrows ncols]指定了变换后的具体行数(高)和列数(宽)
C = imread('lenna.jpg');
D = imresize(C,2,'nearest');
imshow(C);title('原图');figure;
imshow(D);title('放大2倍');


%%%%%%%%%%%%%%%%%%%%%
%采用imrotate实现旋转
%格式imrotate(A,angle,method,'crop');
%angle为旋转角度，正值逆时针旋转，method插值，crop会裁剪旋转的图使其大小和原图一致
A = imread('lenna.jpg');
B = imrotate(A,30,'nearest','crop');
subplot(1,2,1);imshow(A);title('原图');
subplot(1,2,2);imshow(B);title('旋转逆时针30度');

