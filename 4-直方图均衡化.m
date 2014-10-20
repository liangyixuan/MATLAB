%直方图均衡化函数 [J T]=histeq(I); J是输出矩阵，T是变换矩阵，I是原始图
%直方图均衡化算法自动确定灰度变换函数，从而获得均匀直方图。
%图像归一化就是将图像转变为唯一标准形式以抵抗各种变换，从而消除同类图像不同变形体之间的差异。
%图像归一化用于消除灰度（光照）因素造成的图像差异时称为灰度归一化。
I = imread('lenna_gray.jpg');
I = im2double(I);  %转换格式为double

%增加对比度
I1 = 2 * I - 55/255;  %对比度线性变换
subplot(4,4,1);
imshow(I1);
subplot(4,4,2);
imhist(I1);  %灰度直方图
subplot(4,4,3);
imshow(histeq(I1));  %直方图均衡化，以实现图像灰度归一化，
subplot(4,4,4);
imhist(histeq(I1));

%减小对比度
I2 = 0.5 * I + 55/255;  
subplot(4,4,5);
imshow(I2);
subplot(4,4,6);
imhist(I2);
subplot(4,4,7);
imshow(histeq(I2)); 
subplot(4,4,8);
imhist(histeq(I2));

%线性增加亮度
I3 = I + 55/255; 
subplot(4,4,9);
imshow(I3);
subplot(4,4,10);
imhist(I3);
subplot(4,4,11);
imshow(histeq(I3)); 
subplot(4,4,12);
imhist(histeq(I3));

%线性减小亮度
I4 = I - 55/255; 
subplot(4,4,13);
imshow(I4);
subplot(4,4,14);
imhist(I4);
subplot(4,4,15);
imshow(histeq(I4)); 
subplot(4,4,16);
imhist(histeq(I4));
