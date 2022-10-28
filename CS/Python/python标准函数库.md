---
title: python标准函数库
date: 2021-07-27 10:04:43
categories:
- Python
---
这个库包含了多个内置模块 (以 C 编写)，Python 程序员必须依靠它们来实现系统级功能，例如文件 I/O，此外还有大量以 Python 编写的模块，提供了日常编程中许多问题的标准解决方案。其中有些模块经过专门设计，通过将特定平台功能抽象化为平台中立的 API 来鼓励和加强 Python 程序的可移植性。

Windows 版本的 Python 安装程序通常包含整个标准库，往往还包含许多额外组件。对于类 Unix 操作系统，Python 通常会分成一系列的软件包，因此可能需要使用操作系统所提供的包管理工具来获取部分或全部可选组件。

## 大类

- 文本处理：string和re正则表达式
- 二进制服务
- 数据类型：如复制和多种容器和算法
- 数学模块
- 函数编程：functolls、operator
- 文本和目录访问：path
- 数据持久化：对象序列化？
- 数据压缩与存档：ZIP格式等
- 文件格式：csv、config等格式
- 加密服务：哈希表、密钥
- 通用操作系统服务：os、time、logging
- 并发执行：线程、进程、调度
- 网络和进程间通信、套接字、异步IO等
- 互联网数据处理、email、json
- 结构化标记处理：html、xml
- 互联网协议：
- 多媒体服务：音视频处理
- 国际化：locale
- Tk GUI
- ...



参考：https://docs.python.org/zh-cn/3/library/index.html