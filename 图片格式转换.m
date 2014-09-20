%转换图片格式% 
A = imread('lenna.jpg'); %读入图像，图像放在了在工作目录下，省略了完整的路径名
whos A %查看图像变量的信息
imwrite(A,'lenna.bmp'); %将图像写入文件lenna.bmp中，并起到转换图像格式读入作用
