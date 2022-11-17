---
title: 远程服务器——sftp和scp
date: 2021-07-27 10:03:51
categories:
- Linux
---
## 1. 文件服务

### sftp与scp

sftp相当于把ssh当ftp用，在你不知道服务器上有什么文件的时候，时候用这个。

如果已知服务器上的文件，可以直接用scp

```shell
sftp -P [port] [destination]
```

sftp可以直接传目录。

#### 下载到本地

```shell
get get /etc/supervisor/file.conf   /etc/supervisord.d #下载到目录中
get -r /home/data  /home/my #下载整个文件夹
```

#### 上传到服务器

```shell
 put /home/fuyatao/downloads/Linuxgl.pdf  /var/www/fuyatao/
 put /home/fuyatao   /var/www/fuyatao/ # s
```



### 1. SCP本地上传到服务器

> scp -P port source destination

范例：

```shell
scp -P 335 .\Image00382.jpg user@IP:~/Deeplearning/ELM/1D/imags
```

其实上传或下载的重点是那个冒号 (:) 啰！连接在冒号后面的就是远程主机的档案。 因此，如果冒号在前，代表的就是从远程主机下载下来，如果冒号在后，则代表本机数据上传啦！ 而如果想要复制目录的话，那么可以加上 -r 的选项！