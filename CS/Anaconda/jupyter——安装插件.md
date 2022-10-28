## jupyter lab安装插件

在jupyter lab中开始支持插件，比如plotly插件，latex插件，github插件等。

### 软件要求

```shell
conda install "jupyterlab>=3" "ipywidgets>=7.6"
```

### 插件要求

插件是用nodejs安装的，所以需要安装npm包管理器和nodejs

大部分插件可能要求nodejs版本大于12，且必须是偶数版本（比如plotluy插件）

但是用默认源或者国内源安装的可能只是6.18

建议开外网conda-forge源，或者命令（代表其他版本安装）。

同时，可能需要给npm开proxy功能。



一般插件安装失败要么是网络问题，或者是nodejs版本依赖错误，可以查看log信息。