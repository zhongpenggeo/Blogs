### grd2kml
从一个网格文件中建立kml图像（可在谷歌地图中显示）  
grd2kml会读取一个2D的grd文件，并绘制png和kml，像素点为256*256；  
因此会对grd用高斯滤波做下抽样，当然也可以选择其他滤波方法。
#### 语法
gmt grd2kml grid [ -Ccpt ] [ -EURL ] [ -Ffiltercode ] [ -Hfactor ] [ -I[intensfile|intensity|modifiers] ] [ -Ltilesize ] [ -Nprefix ] [ -Q ] [ -Ttitle ] [ -V[level] ] [ -fflags ] [ –PAR=value ]  

#### 必选项
grd文件
#### 可选项
- -C*cpt*
- -E*url*：不从本地而是从url网址上下载输入文件
- -H*factor*：改善光栅图片的质量，通过sub-pixel smoothing flag to psconvert

---
2018-11-10:测试脚本失败，这个命令估计还有bug，难以使用。
