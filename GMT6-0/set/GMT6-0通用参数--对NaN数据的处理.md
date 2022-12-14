### 问题：
在网格化数据中，经常会出现的一种情况是：少部分位置会由于种种原因缺少数据，但是网格化的时候这些点位可能会被设置为NaN，或者是一个特别的数字。  
在GMT6.0中，增加了一些通用参数，来对这些数据做一定的处理。
#### -d
> -d[i|o]nodata

- -d控制了对NaN数据的处理；  
- nodata要用一个具体的数值来代替；
- 对输入数据，用NaN来代替等于nodata的值；
- 对输出数据，用nodata来代替NaN；
- -di表示只对输入数据处理，-do表示只对输出数据处理。

#### -s
- 压制Z值中NaN的输出；
- a表示跳过有一个等于NAN的记录；
- r表示反转压制，比如只输出等于NaN的值，
- Alternatively, indicate a comma-separated list of all columns or column ranges to consider for this NaN test (Column ranges must be given in the format start[:inc ]:stop, where inc defaults to 1 if not specified).
