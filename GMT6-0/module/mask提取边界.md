---
title: mask提取边界
date：2019-1-28
categories:
- GMT6
tags:

mathjax: true
grammar_cjkRuby: true
---
**注意：GMT5.4也可以用这个命令，名为psmask**  

### 用法
用来裁剪或掩盖地图上没有数据的区域；  
- 比如你的图形不是规则的四边形，希望提取其边界，可以用mask
- 只绘制数据比较可靠的区域，自己定义数据可靠的程度
- 类似于psclip的功能，开启clip；直到第二次用了-C结束clip

### 语法
gmt mask [ table ] -Iincrement -Jparameters -Rregion [ -B[p|s]parameters ] [ -C ] [ -Ddumpfile ] [ -F[l|r] ] [ -Gfill ] [ -Jz|Zparameters ] [ -L[+|-]nodegrid ] [ -N ] [ -Qcut ] [ -Ssearch_radius[unit] ] [ -T ] [ -U[stamp] ] [ -V[level] ] [ -Xx_offset ] [ -Yy_offset ] [ -bibinary ] [ -dinodata ] [ -eregexp ] [ -hheaders ] [ -iflags ] [ -pflags ] [ -rreg ] [ -ttransp ] [ -:[i|o] ] [ –PAR=value ]  

### 参数
#### 必选参数
- -I
- -J
- -R

#### 可选项
- -B
- -C：结束裁剪，一般在前面用mask开启了裁剪，所以在结束裁剪时加上-C
- -D：输出边界到一个或多个文件中
- -F[l|r]：强制裁剪的方向，默认是Fl向左，需要-D
- -G*fill*：填充多边形
- -L[+|-]nodegrid：用1（有数据）和0（无数据）来保存内部网格，+令无数据的为NaN，-令NaN为无数据。
- -N：反转裁剪区域
- -D*cut*：不输出少于*cut*点的多边形，需要-D
- -S*search_radius[unit]*：设置边界的影响，默认是0，（可以用来扩边）
- -T：与-G配合填充

### 示例
1. 裁剪  

```shell
# 开始裁剪，直到用-C结束裁剪
gmt mask africa_grav.xyg -R20/40/20/40 -I5m -JM10i > mask.ps
```
2. 提取边界

```
gmt mask africa_grav.xyg -R20/40/20/40 -I5m -Dall_pols.txt
```
3. 填充

```
gmt mask africa_grav.xyg -R20/40/20/40 -I5m -JM10i -T -Gwhite > mask.ps
```
## grdmask
从多边形或数据中获得grd掩膜文件

### 参考资料：
[mask](http://gmt.soest.hawaii.edu/doc/latest/mask.html)
