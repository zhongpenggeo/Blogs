### 问题
有时候，我们需要用一些特殊的符号把输入文件分为多段；  
e.g. 一个文件中可能包含多个断层的点位，每个断层之间会用一个分割符，通常是 >; 如下面是两个断层的数据；  
> 112 38  
113 38  
114 38  
\>    
119 40  
120 40  
121 40  

有时候，可能分割符不是默认的>，这时候需要自己设置；  
### IO_SEGMENT_MARKER
IO_SEGMENT_MARKER是用来设置分隔符的；  
- 如果分隔符有多个，那么用逗号分开；
- 几个有特殊意义的分隔符：
    - B表示空行；设置B表示空行时分隔符
    - N表示NaN；设置为N表示NaN时分隔符；
- Finally, if a segment represents a closed polygon that is a hole inside another polygon you indicate this with -Ph. This setting will be read and processed if converting a file to the OGR format.
