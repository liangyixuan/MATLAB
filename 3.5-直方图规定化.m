%生成特定直方图图像的方法叫直方图规定化（直方图匹配）
% histeq函数不仅可以直方图均衡化，而且可直方图规定化
% [J T]=histeq(I,hgram),将I处理为以指定向量hgram为直方图的图像
% double型hgram取值为[0,1],uint8型hgram取值为[0,255],uint16型取值为[0,65535]
I = imread('lenna_gray.jpg');  %读入原图
I1 = imread('cao_gray.jpg');  %读入要匹配直方图的图像
I2 = imread('yan_gray.jpg');  %读入要匹配直方图的图像

%计算直方图
[hgram1,x] = imhist(I1);
[hgram2,x] = imhist(I2);

%直方图规定化
J1 = histeq(I,hgram1);
J2 = histeq(I,hgram2);

%绘图
subplot(2,3,1);
imshow(I);title('原图');
subplot(2,3,2);
imshow(I1);title('标准图1');
subplot(2,3,3);
imshow(I2);title('标准图2');
subplot(2,3,5);
imshow(J1);title('规定化到1');
subplot(2,3,6);
imshow(J2);title('规定化到2');

%绘直方图
figure;

subplot(2,3,1);
imhist(I);title('原图');
subplot(2,3,2);
imhist(I1);title('标准图1');
subplot(2,3,3);
imhist(I2);title('标准图2');
subplot(2,3,5);
imhist(J1);title('规定到1');
subplot(2,3,6);
imhist(J2);title('规定到2');
