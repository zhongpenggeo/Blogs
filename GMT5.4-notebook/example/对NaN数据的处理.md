对于NaN数据的处理，主要有两个通用选项。
### -s
#### 用法
> -s[cols][a|r]

- -s主要是压制NaN数据的输出。加上`a`表示忽略等于NaN的记录；
- 加上`r`表示reverse，只输出等于NaN的记录；
- Alternatively, indicate a comma-separated list of all columns or column ranges to consider for this NaN test (Column ranges must be given in the format start[:inc ]:stop, where inc defaults to 1 if not specified)；这个可能在多列的时候有用

#### 示例
```shell
#这样可以使得输出的TXT中没有NaN的值
gmt grd2xyz input.grd -sa > output.txt
```
### -d
-d可以把某些输入的某个值当做NaN，或者输出时把NaN当做某个值处理
#### 用法
> -d[i|o]nodata

