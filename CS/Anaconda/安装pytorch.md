#### 1. 建立虚拟环境

建议如此，避免冲突

#### 2. 查看安装命令

首先需要了解自己的cuda版本

```shell
# in linux
nvcc --version
```

根据cuda版本，前往pytorch官网查看安装命令：

```shell
conda install pytorch torchvision torchaudio cudatoolkit=10.1 -c pytorch
```

#### 3. 从清华源安装

参考：

[Anaconda清华镜像源的使用及安装Pytorch失败问题解决_WannaSeaU的博客-CSDN博客_anaconda清华镜像安装教程](https://blog.csdn.net/WannaSeaU/article/details/88427010)



添加镜像：  

运行以下命令，将清华镜像添加至Anaconda仓库中

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```

 Conda Forge

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
```

 msys2

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
```

 bioconda

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
```

 menpo

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/menpo/
```

pytorch

```shell
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/

# for legacy win-64
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/peterjc123/
```

**注意，用清华源安装时，要去掉`-c pytorch`，否则还是会使用国外源，因为优先级更高。**