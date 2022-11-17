---
title: Debug方法
date: 2021-07-27 09:59:04
categories:
- C++
---
## 1. 取样法
### 1.1添加printf函数；

缺点：
- 会带来更多的编辑和编译次数
- bug修复后，还要注释掉这些语句；

改进方法：  
在c语言中，可以使用预处理器
```
#ifdef DEBUG
	printf("variable x has value = %d\n",x);
#endif
```
在编译程序时可以加上编译器标志-DDEBUG。  
此外，还可以使用`数值调试宏`；

### 1.2 无需重新编译的方法
在程序中增加一个作为调试标志的全局变量，使得用户可以在命令行加上-c切换是否调试；  
```
if (debug) {
	sprintf(msg, ...)
	write_debug(msg)
}
```
即使程序已经发布了，还是可以使用调试模式。

## 2. gdb
gdb使用方法：
1. 先编译程序：gcc -g -o debug3 debug3.c
2. 进入gdb：gdb debug3
3. 使用gdb自带的命令，如：break；run; print; cont;

## 3. 其他调试工具

## 内存泄露
如果一个分配好的内存的指针变量的取值发生变化，而又没有其他指针指向这块内存，拿它将无法访问，这是一种内存泄漏现象。