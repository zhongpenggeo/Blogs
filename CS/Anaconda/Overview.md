### 1. 简介

Anaconda（[官方网站](https://link.zhihu.com/?target=https%3A//www.anaconda.com/download/%23macos)）就是可以便捷获取包且对包能够进行管理，同时对环境可以统一管理的发行版本。Anaconda包含了conda、Python在内的超过180个科学包及其依赖项。

### 2.  Anaconda、conda、pip、virtualenv的区别
#### 2.1 Anaconda
其包含的科学包包括：conda, numpy, scipy, ipython notebook等。
注意：Anaconda有2和3两个版本，但是每个版本都可以同时安装python2和3.
#### 2.2 Conda
conda是包及其依赖项和环境的管理工具。

适用语言：Python, R, Ruby, Lua, Scala, Java, JavaScript, C/C++, FORTRAN。

用途：
1.  快速安装、运行和升级包及其依赖项。
2. 在计算机中便捷地创建、保存、加载和切换环境。

#### 2.3 pip
pip是用于安装和管理软件包的包管理器。

#### 2.4 virtualenv
创建独立的python环境的工具
解决问题：

- 当一个程序需要使用Python 2.7版本，而另一个程序需要使用Python 3.6版本，如何同时使用这两个程序？如果将所有程序都安装在系统下的默认路径，如：/usr/lib/python2.7/site-packages，当不小心升级了本不该升级的程序时，将会对其他的程序造成影响。
- 如果想要安装程序并在程序运行时对其库或库的版本进行修改，都会导致程序的中断。
- 在共享主机时，无法在全局 site-packages 目录中安装包。

virtualenv将会为它自己的安装目录创建一个环境，这并不与其他virtualenv环境共享库；同时也可以选择性地不连接已安装的全局库。

#### 2.5 pip vs conda
依赖项检查

▪ pip：

① 不一定会展示所需其他依赖包。

② 安装包时或许会直接忽略依赖项而安装，仅在结果中提示错误。

▪ conda：

① 列出所需其他依赖包。

② 安装包时自动安装其依赖项。

③ 可以便捷地在包的不同版本中自由切换。



环境管理

▪ pip：维护多个环境难度较大。

▪ conda：比较方便地在不同环境之间进行切换，环境管理较为简单。



对系统自带Python的影响

▪ pip：在系统自带Python中包的更新/回退版本/卸载将影响其他程序。

▪ conda：不会影响系统自带Python。



 适用语言

▪ pip：仅适用于Python。

▪ conda：适用于Python, R, Ruby, Lua, Scala, Java, JavaScript, C/C++, FORTRAN。



conda与pip、virtualenv的关系

▪ conda结合了pip和virtualenv的功能。

  

### 3. 环境之间的关系

基础环境为：base，在命令行的最前端会出现"(base)"字样；

自己创建的环境是在基础环境的基础上，即：自定义环境（虚拟环境）可以使用base中的包。

windows是这样



但在Linux中base和其他虚拟环境好像没有关系。

测试表明，确实base和其他环境不是继承关系，但是都已经自带了一些基础包，如numpy