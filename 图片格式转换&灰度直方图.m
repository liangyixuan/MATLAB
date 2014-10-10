%读取图像的属性信息，如大小，修改时间，格式等，%本语句后面不加’；‘号%%
imfinfo('lenna.jpg')

%转换图片格式% 
A = imread('lenna.jpg'); %读入图像，图像放在了在工作目录下，省略了完整的路径名
whos A %查看图像变量的信息，可以知道是否是uint8类型
imwrite(A,'lenna.bmp','BMP'); %将图像写入文件lenna.bmp中，并起到转换图像格式读入作用,'BMP'可省略
imshow(A); %显示图像

%在不同窗口显示%
figure;
imshow(A);
figure;
imshow(A,[0 1]); %[x y]指定显示灰度图像时的灰度范围
%在同一窗口显示%
figure;
subplot(1,2,1);
imshow(A);
subplot(1,2,2);
imshow(A,[0 1]);

%图片数据类型转换并输出
A = imread('lenna.jpg');
B = im2double(A); %  im2uint8  im2uint16  im2double分别将图像转变为uint8 uint16 doubl类型
imwrite(B,'lenna_d.jpg','JPG');
whos B %查看B的图像变量信息
 
%图片存储格式转换
A = imread('lenna.jpg');
C = rgb2gray(A); % rgb2gray 由RGB图转为灰度图
imwrite(C,'lenna_gray.jpg','JPG');
imhist(C); %显示灰度图像的直方图。imhist(C，n);%n为指定灰度级数目，而不是将所有灰度全部列出
%[counts,x] = imhist(C); %counts为直方图的数据向量，counts(i)表示第i个灰度区间内的像素数目，x是保存了对应的灰度小区间的向量
%得到这些值后也可使用stem(x,counts)手工绘制直方图
title('Graph'); %给直方图图加标题

%通过计算counts与图像中像素总数的商可以得到归一化直方图
[m,n] = size(C); %计图像大小
[counts,x] = imhist(C,64); %计算有64灰度区间的直方图
counts = counts / m / n; %计算归一化直方图个灰度区间的值
stem(x,counts);

