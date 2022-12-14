作用：对墨卡托投影或地理格式的图片提取子区域，并转换为grd网格数据。
#### 语法
gmt img2grd imgfile -Ggrdfile -Rregion -Ttype [ -C ] [ -D[minlat/maxlat] ] [ -E ] [ -Iinc ] [ -M ] [ -Nnavg ] [ -S[scale] ] [ -V[level] ] [ -Wmaxlon ] [ -nflags ] [ –PAR=value ]
#### 必选项
- 输入图片
- -G*outgrd*：outgrd是输出grd的文件名
- -R
#### 可选参数
- -M：输出Spherical Mercator grid（默认是经纬度），加了-M后-R的结果会自动微调；
- -E：如果-M没有用，那么可以用-E可以强制要求输出区域与-R设置的一样。
- -S：把img的值乘以S后面跟的因子。
- -T*type*：处理constraint information的encoding。type=0表示没有这样的encoding（用在1995version以前的重力数据中），>1表示有encoding；=1获取所有点的值；=2在constrainned点中获得值，在interpolated点处为NaN；=3，在constrained点出为1，在interpolated点处为0（T默认是1）
- -M：输出为spherical mercator grid（默认是地理经纬度grid）
- 其他

#### 测试例子
这里贴一个从GMT的GitHub主页上的例子，小有修改。
```sh
#!/bin/bash
ps=imgmap.ps
# 用@表示从网上下载资源，会存放在~/.gmt/cache中
IMG=@topo.8.2.img
# Get merc grid
# 这里吧img转为grd文件，-T1
gmt img2grd $IMG -R180/200/-5/5 -T1 -S1 -Gimg.nc -M
gmt makecpt -Crainbow -T-8000/0 > t.cpt
gmt grdimage img.nc -Jx0.25i -Ct.cpt -P -K -Xc > $ps
gmt psbasemap -R -Jm0.25i -Ba -BWSne -O -K >> $ps
# Get geo grid
gmt img2grd $IMG -R -T1 -S1 -Gimg.nc
gmt grdimage img.nc -Jm -Ct.cpt -O -K -Ba -BWSne -Y3.25i >> $ps
# Get resampled geo grid
# 注意这里把R改小了，观察其效果
gmt img2grd $IMG -R190/200/-5/5 -T1 -S1 -Gimg.nc -E
gmt grdimage img.nc -Jm -Ct.cpt -O -K -Ba -BWSne -Y3.25i >> $ps
gmt psxy -R -J -O -T >> $ps
```
结果：  
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imgmap.jpg)
