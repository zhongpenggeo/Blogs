刚刚大概看了一下cookbook，个人觉得主要的变化有以下几个：  
1. 工作流程的变化  
- 以前写脚本的基本步骤是：设置参数-->绘图-->格式转换；  
- 现在的流程是：begin-->设置参数--->绘图-->end  
- 即所有的脚本都要加上begin（开始的标志），在末尾要加上end（结束）,不再需要自己转换图片格式。    
2. 模块的变化  
- 为了对应工作流程的变化，新增了多个管理模块：begin，end，figure，subplot，clear，以及帮助模块doc。  
- 很多模块改名了，去掉了gmt，ps或grd前缀，比如gmtset变为set；grdimage变为image，但是用法基本没有变化。
- 新增了一些转换模块，如xy数据转换：convert，以及grd转kml的grd2kml（以前只可以xy数据转kml），还有增加了movie模块，制作动图。   
- 总体来看，新增的模块都是有迹可循的，不少模块之前已经在5.4.4版本里面小范围使用了，如gmt_shell_functions.sh里面就有一些好用的代码。
 
---

具体细节如下：

#### 1. 工作流程的变化
1. 千年大坑要被填起来了！  
一直以来，-K，-O都是写脚本过程中最常爆雷的（说多了都是泪），直到后来发现原来还有psxy -T这个用法。  
到了6.0，**-K，-O，还有-P统统都不再需要了**，可喜可贺！  
2. 不需要显示地输出到Postscript文件中了，会生成一个隐式的Postscript；。
3. GMT命令会在一个特殊的临时目录中运行，所以大量脚本可以同时执行不会相互干扰，同时可以用gmt.history自动填充-J和-R选项（这一点应该在5就可以了）；
4. 当所有命令执行完毕，隐藏的postscript会自动完成（不需要-O也可以自动完成了），并且被转换为图片（默认是PDF格式）  
5. 页面尺寸会自动设置并且适当地裁剪好。

#### 2. 模块的变化（概览）
1.  管理模块
每次画图前都要显示写出：  
> gmt begin 

相当于每次吃放前要说一声：我要开动了！。（脑补日漫）  

画完图之后要显示写出：
> gmt end

相当于吃完饭后要说：我吃完了！

最后可能还要清理残羹剩菜：  
> gmt clear

begin  | GMT绘图的开头（一般要写在脚本开头)
| :------| :------
clear   |  删除当前的history、conf、cpt、 or cache
end  | GMT绘图结束，产生相应的图片
figure | 设置figure的格式，绘制多张图时可以用figure新建一个画布
subplot | 设置figure subplot（估计类似于matlab的subplot）的参数和选择，对放置多张图很方便
docs | 列出模块的帮助文档，甚至可以精确到模块某一个参数的文档
2. 其余模块的变化（个人猜测，不完全对）

GMT6.0 | GMT 5.4
| :------| :------
plot  | psxy
colorbar | psscale
sphinterpolate | 
movie |
grd2kml |
spatial |
convert |
grdfill |


以上是我注意到几个常用的命令的变化，GMT5.4一栏为空表示旧版本没有对应的命令或操作。  
**解释：**
> - sphinterpolate是球面网格化，以前GMT基本是在平面上绘图（grdview除外），从来没有对3D网格化。  
> - movie是制作动图  
> - grd2kml是我个人很期待的一个功能，之前一直在想怎么把PS图件转换为KML，GMT5.x中psconvert可以做到，但比较麻烦，限制比较多，参见：[psconvert图片格式转换](https://www.jianshu.com/p/913b52b99001)；期待，要重点关注  
> - spatial对线和多边形在地理空间中操作。    
> - convert把表格数据（xy数据）转化，有点类似于grdconvert，但那个模块是对grd文件做格式转换。  
> - grdfill是对grd文件中的空洞区做插值。  

所以，GMT6版本的的**脚本风格**是：
```
#!/bin/bash

gmt begin gmt-map jpg
gmt set FONT_TITLE=24p,Helvetica-Bold

gmt coast -JM10c -RUS+R3 -A1000 -B+t"AMERICA map" -W1/1p -N1/1p 

gmt end
gmt clear all
```
![image.png](https://upload-images.jianshu.io/upload_images/7955445-05882b23df02ecd1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440 )

同时增加了GitHub脚本库：[GMT6.0-example](https://github.com/zhongpenggeo/GMT_demo/tree/master/GMT6)

---
#### 更多资料
**[GMT6.0的学习笔记](https://www.jianshu.com/p/ac52b407efa1)**
---
2018-11-7： 第一次更新
2018-11-9：第二次更新，大概翻了一下cookbook，增加了github脚本库。
