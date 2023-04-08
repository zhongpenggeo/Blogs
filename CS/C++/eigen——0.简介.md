### 简介

Eigen库是一个开源的矩阵运算库，其利用C++模板编程的思想，构造所有矩阵通过传递模板参数形式完成。由于模板类不支持库链接方式编译，而且模板类要求全部写在头文件中，从而导致导致Eigen库只能通过开源的方式供大家使用，并且只需要包含Eigen头文件就能直接使用。

有效支持[线性](https://so.csdn.net/so/search?q=线性&spm=1001.2101.3001.7020)代数，矩阵和矢量运算，数值分析及其相关的算法。Eigen是一个开源库，从3.1.1版本开始遵从MPL2许可。

### 头文件和命名空间

```C++
#include<Eigen/Dense>
using namespace Eigen;
```

### 安装

```shell
sudo apt install libeigen3-dev
```

或者手动编译

在[官网]([Eigen](https://link.zhihu.com/?target=http%3A//eigen.tuxfamily.org/index.php%3Ftitle%3DMain_Page))中下载最新版安装包源码，或者可以直接使用wget命令进行下载。之后提取压缩包，进入提取出来的文件夹，在终端中打开，然后进行编译

```bash
mkdir build
cd build
cmake ..
sudo make install
```

最后检查是否安装成功，可以直接在编辑器中输入

```cpp
#include <Eigen>
```

编译通过即安装成功。

### 模块

| 模块        | 头文件                       | 内容                                                         |
| ----------- | ---------------------------- | ------------------------------------------------------------ |
| Core        | #include <Eigen/Core>        | 矩阵和数组 (向量) 类 (Matrix, Array)，基于线性代数还有数组操作 |
| Geometry    | #include <Eigen/Geometry>    | 变换，平移，缩放，2D 旋转和 3D 旋转 (包括四元数和角轴)       |
| LU          | #include <Eigen/LU>          | 使用求解器进行求逆，行列式，LU 分解操作                      |
| Cholesky    | #include <Eigen/Cholesky>    | 使用求解器进行 LLT, LT, Cholesky 分解                        |
| Householder | #include <Eigen/Householder> | Householder 变换；被用作几个线性代数模块                     |
| SVD         | #include <Eigen/SVD>         | SVD 分解与最小二乘求解器                                     |
| QR          | #include <Eigen/QR>          | QR 分解                                                      |
| Eigenvalues | #include <EIgen/Eigenvalues> | 特征值，特征向量分解                                         |
| Sparse      | #include <Eigen/Sparse>      | 稀疏矩阵存储以及相关的基本线性代数                           |
| Dense       | #include <Eigen/Dense>       | 包括 Core, Geometry, LU, Cholesky, SVD, QR, Eigenvalues 的头文件 |
| Eigen       | #include <Eigen/Eigen>       | 包括 Dense 和 Sparse 的头文件                                |

### 编译运行

如果系统找不到Eigen安装路径（`usr/local/include`)，可以手动指定路径

```shell
g++ -I /path/to/eigen/ my_program.cpp -o my_program
```



参考：[Eigen的介绍、安装与入门操作 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/462494086)

[Eigen Tutorial 中文文档(c++版) - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/87613088)