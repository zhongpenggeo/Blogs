---
title: 申请ipv6
date: 2021-07-27 10:03:51
categories:
- Linux
---
#### 问题

如果你只有ipv4地址，但是网卡支持ipv6，可以去申请得到ipv6地址；

### 申请

#### 注册账号

在https://tunnelbroker.net/上注册账号，每个账号可以得到5个ipv6.可以用中国地址

#### 绑定ipv4

![img](https://pic4.zhimg.com/80/v2-fdeda855380e4f69218354acdb59e277_720w.jpg)



#### 服务器开启ipv6

首先确保自己已经开启了ipv6服务，具体可以使用`ifconfig`查看自己是否已经默认分配有有ipv6地址。若没有需要开启（自行百度）

然后，在He网站上，找到 example configurations一栏，选择你的操作系统（奇怪这里没有centos，我选的linux-route2），把命令复制到终端并执行。（这里是把ipv6地址绑定到主机上）

测试是否连通，用`ping6 www.google.com`或者ping其他有v6地址的网站，若有结果，则说明成功。



### 问题

he ipv6的速度可能存在问题，比不上原生ipv4



### 删除ipv6隧道

某种情况下需要删除

```shell
ip tunnel del h
```





参考：https://zhuanlan.zhihu.com/p/33984430

https://www.liuheng.xin/4581.html