---
title: 远程服务器——ssh
date: 2021-07-27 10:03:51
categories:
- Linux
---
## 1. SSH服务器细节设定

设定放置于` /etc/ssh/sshd_config`中

#### port

如果要修改端口，直接更改端口号；

如果要同时使用多个端口，则增加一行port

#### 私钥

本计的私钥和公钥放置于` /etc/ssh/ssh_host_rsa_key`

#### X11

比较重要的是 X11Forwarding 项目，他可以让窗口的数据透过 ssh 信道来传送喔！



#### TCPKeepAlive

```
当达成联机后，服务器会一直传送 TCP 封包给客户端藉以判断对方式否一直存在联机。
# 不过，如果联机时中间的路由器暂时停止服务几秒钟，也会让联机中断喔！
# 在这个情况下，任何一端死掉后，SSH可以立刻知道！而不会有僵尸程序的发生！
# 但如果你的网络或路由器常常不稳定，那么可以设定为 no 的啦！
```



注意，修改过后要重启sshd

```shell
/etc/init.d/sshd restart
```



## 2. 密钥登陆

公钥id_rsa.pub：放置于对方主机，用于加密传输给你的信息

私钥id_rsa：用于解密

所以公钥和私钥是配对的，而且私钥不能泄露



把本机的公钥放置于`$HOME/.ssh/`即可实现密钥登陆

```shell
scp ~/.ssh/id_rsa.pub dmtsai@192.168.100.254:~

cat id_rsa.pub >> .ssh/authorized_keys
```



## 3. 安全设定

sshd 之所谓的『安全』其实指的是『 sshd 的数据是加密过的，所以他的数据在 Internet 上面传递时是比较安全的。至于 sshd 这个服务本身就不是那样安全了！所以说：『非必要，不要将 sshd 对 Internet 开放可登入的权限，尽量局限在几个小范围内的 IP 或主机名即可！这很重要的喔

