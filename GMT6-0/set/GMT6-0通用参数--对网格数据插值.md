### 问题
有时候grid数据可能过于稀疏了，在GMT5.X系列中，需要在网格化的过程中插值。但到了GMT6.0，可以直接对网格数据插值。
#### -n
> -n[b|c|l|n][+a][+bBC][+c][+tthreshold]

- -n用来选择网格插值模式；
- b表示Bspline插值；
- c为bicubic插值；
- l是bilinear插值；
- n是最邻近插值。
- +a是关闭抗混淆计算；
- +b*BC*是覆盖边界条件；加g表示geographic，p时periodic，n是nature boundary；对于p和n来说，还需要加上x或y来指定一个方向还是两个方向都覆盖。
- +c是clip the interpolated grid to input z-min/max [Default may exceed limits]
- +t控制超过多少跟NaN的距离，插值才会发生；1.0要求被插值点的周围有（4或16个点）不是NaN；
- 默认时bicubic插值，开启抗混淆，+t的阈值时0.5，用geographic或natural 边界条件。
