和 vector 容器采用连续的线性空间不同，deque 容器存储数据的空间是由一段一段**等长**的连续空间构成，各段空间之间并不一定是连续的，可以位于在内存的不同区域。

![deque容器的底层存储机制](imags/2-191213161305R5.gif)

![deque容器的底层实现](imags/2-19121316430U40.gif)

参考：[深度剖析deque容器底层实现原理 (biancheng.net)](http://c.biancheng.net/view/vip_7714.html)