%灰度对数变换t=c*log(1+S);  c为尺度比例常数，S为原灰度值
%此对数函数在自变愈小时斜率大，自变量大时斜率小
%用来增强图像中较暗部分的细节，扩展被压缩高值图像中较暗像素。因此广泛用于频谱图像
%典型应用：傅里叶频谱动态范围很大，显示设备不能满足要求而丢大量暗部细节，使用对数变换后图像动态范围合理非线性压缩，清晰显示
I = imread('lenna_gray.jpg');		% 读入原图像
I = im2double(I);			% 转换数据类型为double
F = fft2(I);
F = fftshift(F);
F = abs(F);
T = log(1+F);    %对数函数只能处理double类型的矩阵，所以要先转换
subplot(1,2,1);
%imshow(F,[low high])--指定显示灰度图像的灰度范围，低于low被显示黑色，高于high被显示白色
%若使用空矩阵[]，函数将图像矩阵中最小值指定为low，最大值指定为high，达到灰度拉伸显示效果。常用来改善灰度图像显示效果。
imshow(F,[]);   
title('未经变换的频谱');
subplot(1,2,2);
imshow(T,[]);
title('变换后的频谱');


%gamma变换和灰度调节函数，J=imadjust(I,[low_in high_in],[low_out high_out],gamma),[][]double是类型，取值在0-1之间。
%gamma指定了函数的形状，gamma=1为线性变换
I = imread('lenna_gray.jpg');
subplot(1,3,1);
imshow(imadjust(I,[],[],0.75));
title('gamma=0.75');
subplot(1,3,2);
imshow(imadjust(I,[],[],1));
title('gamma=1');
subplot(1,3,3);
imshow(imadjust(I,[],[],1.5));
title('gamma=1.5');



%灰度阈值变换，将灰度图转成黑二值图像。
I = imread('lenna_gray.jpg');
thresh = graythresh(I);   %灰度阈值由函数来确定，为其返回值
bw1 = im2bw(I,thresh);
bw2 = im2bw(I,130/255);   %手动选择灰度阈值，范围为0-1的双精浮点数，灰度范围在0-255的图像，阈值level=选定的值/255
subplot(1,3,1);imshow(I);title('原图像');
subplot(1,3,2);imshow(bw1);title('自动阈值');
subplot(1,3,3);imshow(bw2);title('阈值130');
