制作动图或movie  
#### 必选项： 
- 标准GMT脚本，
如已经写好一个GMT脚本，map.sh    
- -Cpapersize  
 1080p  
width[unit] xheight[unit] xdpu:如6ix6ix100  
- -Nprefix  
次级目录的名字，框架图片和最终movie存放位置      
每次运行前，需要确保prefix这个目录不存在，否则出错。
- -Tframes|timefile[+pwidth][+sfirst][+w]  
frame是为总帧数  
timefile是一个包含一系列参数的文件，一帧一个记录；这些在columns中的值可以被用在脚本中，名为：MOVIE_COL1, MOVIE_COL2
#### 可选项：
- -A：生成gif（若要生成gif，需要安装GraphicsMagick）
- 

#### 其余参数
一些参数会自动配置，并且可以用在脚本中，包括：MOVIE_WIDTH、MOVIE_FRAME等
![topo3D.gif](https://upload-images.jianshu.io/upload_images/7955445-ef2fa58411292447.gif?imageMogr2/auto-orient/strip)


#### 注意：
1. 必须先把标准GMT脚本运行一遍，否则若脚本有问题直接运行movie是不会输出错误信息的。
2. 
- 主脚本  
```
#########################################################################
# File Name: test_movie.sh
# Author: pengzhong
# mail: zhongpenggeo@163.com
# Created Time: Fri 09 Nov 2018 09:05:05 PM CST
#########################################################################
#!/bin/bash
rm -r topo3D
gmt movie topo3D.sh -Ntopo3D -T70 -Agif -C35cx35cx100
```
- **topo3D.sh**
```
#!/bin/bash
gmt begin 
RR=R70/110/15/45
RZ=R70/110/15/45/-4000/5000
JJ=JM10c
JZ=JZ4c
CPT=etopo1
GRD=Tibet_topo.grd
#pp=p0/40
PP=p$[ $MOVIE_FRAME*5 ]/40
gmt set MAP_FRAME_TYPE=fancy

gmt basemap -$RZ -$JJ -$JZ -$PP -B5  -BSEnw 
gmt grdview $GRD -$JJ -$JZ -$RZ    -Qi500 -N-4000+ggray -C$CPT -$PP 
gmt end
```
[movie脚本及数据下载](https://github.com/zhongpenggeo/GMT_demo/tree/master/GMT6/movie)


---
#### 改进
movie的原理大概是生成多个png图片，然后再把他们合成gif，同时控制了一些框架等设置，个人感觉比较复杂，不如直接用for循环调用GMT绘制多个图，在利用imagmagick软件的convert直接把他们合成GIF来的快，脚本也更容易些。  
- 脚本：
```
#!/bin/bash

RR=R70/110/15/45
RZ=R70/110/15/45/-4000/5000
JJ=JM10c
JZ=JZ4c
CPT=etopo1
GRD=Tibet_topo.grd
ILLU=topo.i

for ((num=2; num<360; num=num+5))
do
    gmt begin 
    gmt figure topo3D_${num} png A2c
    gmt set MAP_FRAME_TYPE=fancy
    
    gmt psbasemap -$RZ -$JJ -$JZ -p${num}/40 -B5  -BSEnw 
    gmt grdview $GRD -$JJ -$JZ -$RZ    -Qi500 -N-4000+ggray -C$CPT -p${num}/40
    gmt end
done    
gmt clear all
convert -delay 1 -loop 0 topo3D*.png topo3D.gif
```
[脚本及数据下载](https://github.com/zhongpenggeo/GMT_demo/tree/master/GMT6/movie2)

---
#### 更多资料
**[GMT6.0的学习笔记](https://www.jianshu.com/p/ac52b407efa1)**
