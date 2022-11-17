---
title: windows下不打开界面运行matlab
date: 2021-07-27 10:03:51
categories:
- Linux
---
比如当前目录下有一个format_density.m文件
> matlab -nosplash -nodesktop -wait -r format_density 

注意文件不要加后缀.m  
即可运行，但还是会弹出一个框框。

注意：不能识别相对路径

