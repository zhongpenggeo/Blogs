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
- 其他
