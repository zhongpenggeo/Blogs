命令：  
> gmt gmtset FORMAT_GEO_MAP ddd:mm:ssF

注意：如果你没有用投影，比如-JX，那么这个设置不会起作用！！！（花了一下午的时间明白这个道理）

-  ddd:mmF => 35:45W
-  ddd:mmG => 35:45 W
-  ddd:mm:ss => 40:34:24
-  ddd.xxx => 36.250

[+|-]D ：表示将地理数据以浮点数的形式输出，浮点数的格式由FORMAT_FLOAT_OUT
决定 - D ：经度输出范围为 -180 到 180 - +D ：经度输出范围为 0 到 360 - -D ：经度输出范围
为 -360 到 0 

- [+|-]ddd[:mm[:ss]][.xxx][F|G  
-   ddd ：固定格式的整型弧度
-  : ：分隔符
-  mm ：固定格式的整型弧分
-  ss ：固定格式的整型弧秒
-  .xxx ：前一个量的小数部分
-  F ：用 WSEN 后缀来表示正负号  
-  G ：与 F 相同，但后缀前有一空格  
-  +|- ：默认经度范围为-180 到 180，若加正号则范围为 0 到 360，加负号则范围为-360 到0

**更多资料**   
[GMT目录](https://www.jianshu.com/p/321f67983c42)
