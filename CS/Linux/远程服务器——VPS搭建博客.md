---
title: 远程服务器——VPS搭建博客
date: 2021-07-27 10:03:51
categories:
- Linux
---
## 1. 服务器

以centos 7为例

- 建立git用户
- 安装git
- 安装nginx

### 1. 安装nginx

```shell
yum install – y epel-release //添加源
yum install nginx //下载
systemctl start nginx //开启服务
systemctl status nginx //查看服务状态
systemctl enble nginx # 开机自启
```

配置：

```shell
cd /etc/nginx/conf.d
vim default.conf
```

把网站的存储放置于`/usr/share/nginx/html`

```txx
server {
       listen       80;
       # 修改server_name为自己之前注册好的域名,没有可删除这一行
       server_name  www.brucehan.top brucehan.top;

       location / {
       root   /usr/share/nginx/html;
       index  index.html index.htm;
   	}
   }
```

### 2. 创建git

创建一个用户git，并根据提示设置密码，用来专门运行git服务，并赋予git用户sudo权限。

```
$ adduser git
$ chmod 740 /etc/sudoers
$ vim /etc/sudoers
```

找到以下内容：

> ```
> ## Allow root to run any commands anywhere
> root    ALL=(ALL)     ALL
> ```

在下面添加一行：`git ALL=(ALL) ALL`，保存。检查git用户权限确保git用户能够读写`/usr/share/nginx/html`目录。

```
$ ls -l /usr/share/nginx/
total 4
drwxrwxrwx 12 nginx git 4096 Jan 23 00:39 html
```

如果不是，需要修改权限。

```
$ sudo chown git:git -R /usr/share/nginx/html
```

#### 建立git裸库

使用`su git`切换到用户`git`，再执行下列操作：

```
$ cd /home/git
$ git init --bare blog.git
```

git裸库建立好了，我们还需需要使用**git-hooks**同步网站目录。简单来说，我们使用一个钩子文件：*post-receive*，每当git仓库接收到内容时，就会自动调用这个钩子，把内容同步到网站根目录。

在git用户执行：

```
vim ~/blog.git/hooks/post-receive
```

即新建*post-receive*文件，并编辑：

```
#!/bin/bash
GIT_REPO=/home/git/blog.git
TMP_GIT_CLONE=/tmp/blog
PUBLIC_WWW=/usr/share/nginx/html
rm -rf ${TMP_GIT_CLONE}
git clone $GIT_REPO $TMP_GIT_CLONE
rm -rf ${PUBLIC_WWW}/*
cp -rf ${TMP_GIT_CLONE}/* ${PUBLIC_WWW}
```

保存退出，并赋予其执行权限：`chmod +x ~/blog.git/hooks/post-receive`。

客户端发布博客时通过SSH登录，避免每次输入密码。具体ssh配置，请参考相关文档。

去除bash运行权限，避免安全问题：

```shell
vim /etc/paswd
```

将最后一行

```
git:x:1000:1000::/home/git:/bin/bash
#改为
git:x:1000:1000::/home/git:/usr/bin/git-shell
```


## 2. 本地

- 安装hexo： 自行搜索
- 配置deploy：注意要clean再generate 再deploy

#### 配置本地Hexo的_config.yml

```
deploy: 
  type: git
  repo: git@你的服务器IP:/home/git/blog.git
  branch: master
复制代码
```

#### 同步到服务器

```
#清理、生成、部署
$ hexo clean && hexo g && hexo d
```




参考：

https://brucehan.top/2020/01/21/hello-world/

https://juejin.cn/post/6844904008000208909