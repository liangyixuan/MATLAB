%读取图像的属性信息，如大小，修改时间，格式等，%本语句后面不加’；‘号%%
imfinfo('lenna.jpg')

%转换图片格式% 
A = imread('lenna.jpg'); %读入图像，图像放在了在工作目录下，省略了完整的路径名
whos A %查看图像变量的信息
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
