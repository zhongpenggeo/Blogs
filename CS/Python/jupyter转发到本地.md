### 1. 配置密码

进入 IPython 交互IDE，为 Jupyter 创建密钥。

```python
>> from notebook.auth import passwd
>> passwd()
Enter password: 
Verify password: 
'sha1:673a8456a8e8:4377bd9ee8dc33d4cb5a2011f7a89643de15c11c'
```

### 设置配置文件

看了网上其他人的策略通常是直接修改配置文件 `~/.jupyter/jupyter_notebook_config.py` ，但是个人不推荐这种做法，因为这样需要改动到默认的配置文件。

我推荐的做法是自行创建一个配置文件，然后在运行 Jupyter notebook 的时候动态加载配置信息。

(试验证明，确实第二种方法更好，不容易卡，第一种方法经常卡顿)

创建配置文件，可以取名为 `jupyter_config.py` 。

配置内容如下：



```python
c.NotebookApp.ip = 'localhost' # 指定
c.NotebookApp.open_browser = False # 关闭自动打开浏览器
c.NotebookApp.port = 8888 # 端口随意指定
c.NotebookApp.password = u'sha1:d8334*******' # 复制前一步生成的密钥
```

### 启动 Jupyter 服务器

接下来运行 Jupyter 。



```bash
$ jupyter notebook --config=jupyter_config.py
```

但是当前这样还存在一个问题，就是一旦关闭终端，Jupyter 程序也就终止了运行。这是因为该 Jupyter 程序作为当前终端的子进程，在用户终端关闭的时候将收到一个 hangup 信号，从而被关闭。

所以为了让程序能忽视 hangup 信号，可以使用 `nohup` 命令。同时还要配合 `&` 来将程序放入后台运行。



```bash
$ nohup jupyter notebook --config=jupyter_config.py &
```



### 2. ssh端口转发

上面的方法直接法IP与端口向外开放的做法存在风险。

SSH 提供的端口转发，能够将其他 TCP 端口的网络数据通过 SSH 链接来转发，并且自动提供了相应的加密及解密服务。这一过程有时也被叫做“隧道”（tunneling），这是因为 SSH 为其他 TCP 链接提供了一个安全的通道来进行传输而得名。

因此 SSH 端口转发能提供两大功能：

> 1. 加密 SSH 客户端到 SSH 服务器端的通信
> 2. 突破防火墙限制，建立一些之前受限的 TCP 连接

虽然 SSH 端口转发包含有许多内容，但是我们只需要用到其中的本地转发功能。

本地端口转发的命令格式是：



```bash
ssh -L <local port>:<remote host>:<remote port> <SSH hostname>
```

所以，为了同 Jupyter 服务器建立 TCP 连接，还需要在本地与服务器间建立起 SSH Tunneling。

具体到本例操作就是：



```bash
ssh -L 4000:localhost:8888 168.1.xx.xx -p <port> -u <username>
```

之后便能通过 `localhost:4000` 来访问 Jupyter 服务器了。







参考：https://www.jianshu.com/p/a9de7a089834

