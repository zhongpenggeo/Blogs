### 设置代理

**注意**：设置代理前，需要有一个代理服务器，我这里使用本地搭建的socks代理，地址为`socks5://127.0.0.1:1080`，如果你是http代理，改为`http://127.0.0.1:1080`即可

#### 1. 设置git使用http代理

这里注意端口号，比如如果后台用的clash代理，端口号是config.yml配置文件中第二行的`socks-port`而不是第一行的port。（如果在终端使用export设置，则使用di'yi'hang

```shell
git config --global http.proxy socks5://127.0.0.1:7891
```

设置成功后，会在`.gitconfig`文件中添加以下内容

```config
[http]
	proxy = socks5://127.0.0.1:7891
```

查看配置文件是否配置成功

```shell
git config --global -e
```

如果希望主机名也由代理解析（这意味着通过代理传递所有内容），尤其是在克隆`gist`时，可以使用以下设置（关键是它使用socks5h而不是socks5）

```shell
git config --global http.proxy socks5h://127.0.0.1:7891
```

删除http代理：

- 使用以下命令取消设置的代理

  ```shell
  git config --global --unset http.proxy
  ```

- 也可以手动删除`C:/Users/username/.gitconfig`文件中对应的内容

  ```shell
  [http]
    proxy = socks5://127.0.0.1:7891
  ```

- 查看是否删除成功

  ```shell
  git config --global -e
  ```

注意：

- 代理地址`socks5://127.0.0.1:7891`不要加引号（加引号好像也行？）
- 不需要配置`https.proxy`，配置了也没用，只需要设置`http.proxy`，对`http`和`https`都起作用

#### 2. 设置ssh代理

在`C:\Users\username\.ssh\config`文件中添加相关配置，如果没有config文件需要手动创建，connect命令是git Windows客户端`git for windows`自带的, 位于`<Git-install-path>\mingw64\bin\connect.exe`

- socks代理添加以下配置

  ```
  Host github.com(改成你的站点)
  ProxyCommand connect -S 127.0.0.1:1080 %h %p
  ```

- 如果使用http代理，则需要将`-S`改成`-H`使用以下配置

  ```
  Host github.com(改成你的站点)
  ProxyCommand connect -H 127.0.0.1:1080 %h %p
  ```

#### 3. 给某个网站设置代理

如果只想设置某个网站走代理，以`github.com`为例，可使用以下命令

```shell
git config --global http.https://github.com.proxy socks5h://127.0.0.1:1080
```

设置成功后，会在`C:/Users/username/.gitconfig`文件中添加以下内容

```
[http "https://github.com"]
    proxy = socks5h://127.0.0.1:1080
```

查看是否配置成功：

```shell
git config --global -e
```

删除代理：

```shell
git config --global --unset http.https://github.com.proxy
```

查看是否删除成功：

```shell
git config --global -e
```

可以配置多个网站Host

```
Host github.com(改成你的站点)
ProxyCommand connect -H 127.0.0.1:1080 %h %p

Host bitbucket.org(改成你的站点)
ProxyCommand connect -H 127.0.0.1:1080 %h %p
```

如果Host设置为`*`，代理会对所有未配置的Host起作用。以下有三项配置，访问github使用第二项配置，访问bitbucket使用第三项配置，其它网站使用第一项配置

```
Host *
 ProxyCommand "C:/Program Files/Git/mingw64/bin/connect.exe" -H {proxyserver}:{port} %h %p
 IdentityFile "C:/Users/username/.ssh/id_rsa"
 TCPKeepAlive yes
 IdentitiesOnly yes

Host github.com(改成你的站点)
ProxyCommand connect -H 127.0.0.1:1080 %h %p

Host bitbucket.com(改成你的站点)
ProxyCommand connect -H 127.0.0.1:1080 %h %p
```

其中`ProxyCommand`命令中，`%h`引用配置文件中的host，`%p`引用配置的端口(这里没有配置，默认端口为22)

#### 参考

[Git基础——代理 (jeshs.github.io)](https://jeshs.github.io/2019/04/git基础代理/)

[git 设置和取消代理](https://gist.github.com/laispace/666dd7b27e9116faece6)

[Using a socks proxy with git for the http transport](https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport)

[如何为 Git 设置代理](https://segmentfault.com/q/1010000000118837)

[Getting git to work through a proxy server (in Windows)](https://communary.net/2017/01/12/getting-git-to-work-through-a-proxy-server-in-windows/)