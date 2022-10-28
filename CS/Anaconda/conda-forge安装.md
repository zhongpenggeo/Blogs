### 1. conda和conda-forge

conda是一个包管理器，软件的主要开发人员Anaconda Inc.（以前称为Continuum IO）也维护一个单独的软件包频道，这是您在`conda install packagename`不更改任何选项的情况下键入的默认软件包。

而conda-foge是一个软件通道，指的是[Anaconda库](https://anaconda.org/)；

### 2. 更改频道选项

#### 1. 指定通道

```shell
conda install -c some-channel packagename
```

#### 2. 

#### 查看channel配置

```sehll
conda config --show channels
```

#### 添加channel（默认放到顶部）

```shell
conda config --add channels some-channel
```

要将频道添加到列表的末尾并赋予其最低的优先级，请输入

```shell
conda config --append channels some-channel
```

如果您想删除添加的频道，可以通过以下方式删除

```shell
conda config --remove channels some-channel
```



参考：[anaconda - Should conda, or conda-forge be used for Python environments? - Stack Overflow](https://stackoverflow.com/questions/39857289/should-conda-or-conda-forge-be-used-for-python-environments)



### 3. conda-forge安装版本

有时候conda-forge提供了多个命令安装；如果第一个命令安装的版本不对，可以尝试后面的命令。

#### 添加源

- Make sure you have `conda >=4.9`.

```
conda --version
conda update conda
```
- Add `conda-forge` as the highest priority channel.

```
conda config --add channels conda-forge
```

- Activate `strict` channel priority (`strict` will be activated by default in conda 5.0).

```
conda config --set channel_priority strict
```

From now on using `conda install <package-name>` will also find packages in our conda-forge channels.

参考：[A brief introduction — conda-forge 2021.08.25 documentation](https://conda-forge.org/docs/user/introduction.html)

