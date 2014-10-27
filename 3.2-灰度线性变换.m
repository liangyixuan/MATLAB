%改变图像对比度是直方图的缩放与平移，改变亮只是直方图横轴平移，反相则是将直方图水平镜像
I = imread('lenna_gray.jpg');		% 读入原图像

I = im2double(I);			% 转换数据类型为double
[M,N] = size(I);			% 计算图像面积

figure(1);				% 打开新窗口
imshow(I);				% 显示原图像
title('原图像');

figure(2);				% 打开新窗口
[H,x] = imhist(I, 64);		% 计算64个小区间的灰度直方图
stem(x, (H/M/N), '.');		% 显示原图像的直方图
title('原图像');

%参数Fa为线性函数的斜率，Fb为在Y轴截距，I为输入图像灰度
% 增加对比度
Fa = 2; Fb = -55;
O = Fa .* I + Fb/255;

figure(3);
subplot(2,2,1);
imshow(O);
title('Fa = 2 Fb = -55 增加对比度');

figure(4);
subplot(2,2,1);
[H,x] = imhist(O, 64);
stem(x, (H/M/N), '.');
title('Fa = 2 Fb = -55 增加对比度');

% 减小对比度
Fa = 0.5; Fb = -55;
O = Fa .* I + Fb/255;

figure(3);
subplot(2,2,2);
imshow(O);
title('Fa = 0.5 Fb = -55 减小对比度');

figure(4);
subplot(2,2,2);
[H,x] = imhist(O, 64);
stem(x, (H/M/N), '.');
title('Fa = 0.5 Fb = -55 减小对比度');

% 线性增加亮度
Fa = 1; Fb = 55;
O = Fa .* I + Fb/255;

figure(3);
subplot(2,2,3);
imshow(O);
title('Fa = 1 Fb = 55 线性平移增加亮度');

figure(4);
subplot(2,2,3);
[H,x] = imhist(O, 64);
stem(x, (H/M/N), '.');
title('Fa = 1 Fb = 55 线性平移增加亮度');

% 反相显示
Fa = -1; Fb = 255;
O = Fa .* I + Fb/255;

figure(3);
subplot(2,2,4);
imshow(O);
title('Fa = -1 Fb = 255 反相显示');

figure(4);
subplot(2,2,4);
[H,x] = imhist(O, 64);
stem(x, (H/M/N), '.');
title('Fa = -1 Fb = 255 反相显示');
