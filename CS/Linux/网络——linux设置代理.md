注意，终端和git代理方式不同

注意http代理（一般的vpn）和socks5（v2rawy和clash）代理的区别

### 终端代理

 wget、curl 等都走 SOCKS5 代理（只对当前终端有效）

```shell
export ALL_PROXY=socks5://127.0.0.1:1080
export http_proxy=socks5://127.0.0.1:1080
export https_proxy=socks5://127.0.0.1:1080
```

取消代理

```shell
unset http_proxy https_proxy ALL_RPOXY
```

如果只是临时代理，把上述命令在终端输入

如果是长期代理，将代理命令写入配置文件 `~/.profile` 或 `~/.bashrc` 或 `~/.zshrc` 中：



### git代理

代理格式 `[protocol://][user[:password]@]proxyhost[:port]`
 参考 [git-scm.com/docs/git-co…](https://link.juejin.cn?target=https%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-config)

设置 HTTP 代理：

```shell
git config --global http.proxy http://127.0.0.1:8118
git config --global https.proxy http://127.0.0.1:8118
```

设置 SOCKS5 代理：

```shell
git config --global http.proxy socks5://127.0.0.1:1081
git config --global https.proxy socks5://127.0.0.1:1081
```

Git 取消代理设置

```shell
git config --global --unset http.proxy
git config --global --unset https.proxy
```

