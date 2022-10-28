python的命令行解析的标准模块，内置于python，不需要安装。这个库可以让我们直接在命令行中就可以向程序中传入参数并让程序运行

## **传入一个参数**

我们先在桌面新建“arg学习”的文件夹，在该文件夹中新建demo.py文件，来看一个最简单的argsparse库的使用的例子。

```python3
import argparse

parser = argparse.ArgumentParser(description='命令行中传入一个数字')
#type是要传入的参数的数据类型  help是该参数的提示信息
parser.add_argument('integers', type=str, help='传入的数字')

args = parser.parse_args()

#获得传入的参数
print(args)
```

在这个代码中，我们在命令行传入一个数字。使用方法是打开命令行，先将工作目录cd到`arg学习`



参考:[argparse模块用法实例详解 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/56922793)