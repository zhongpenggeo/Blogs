---
title: grdmath生成掩膜文件
tags: 
grammar_cjkRuby: true
---
### 问题
有时候，我们获得的数据是一个不规则区域的，但数据处理往往需要一个规则的举行数据。  
所以一种方法是先用不规则的区域生成一个ROI掩膜文件，再把数据网格化为矩形，处理完之后再应用掩膜文件裁掉之前没有数据的部分。  
### grdmsak
grdmask可以根据table数据构建一个掩膜文件，在有数据的区域为1，没有数据的区域设置为0（或者NAN），边界有自己设置。
#### 参数
- -N：后面接三个参数，分别代表区域外、边界和区域内的值，如-NNaN/1/1，表示区域外设置为NaN，边界和区域内设置为1；
- -I：设置x和y方向的间隔
- -S：设置边界扩大的范围，如-S50k，则表示向外拓展50km；（有向内拓展吗？）

范例：
```sh
#!/bin/bash
GRD=jiangsu-shanghai.grd
OUTGRD=poly.grd
FI=jiangsu-shanghai.txt
RR=`gmt gmtinfo $FI -I-`
gmt grdmask $FI $RR -NNaN/1/1 -I0.02d/0.02d -S0k -G$OUTGRD=nb -V
#gmt grdmath 
```

### 用法
获得掩膜文件后，在利用网格处理后的数据grd 和掩膜grd相乘，可以得到一个网格外面为NaN的网格文件  
##### 注意：两个文件必须是在相同的区域相同的间隔。