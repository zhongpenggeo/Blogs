---
title: v2ray官方安装
date: 2021-07-27 10:03:51
categories:
- Linux
---
#### 1. 时间同步

使用`date -R`命令查看服务器时间，看到是9点25分（本地现在是17点25分）。因为时间不对所以要矫正，使用`cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime`命令将服务器时间调整为亚洲上海（东八区），问你`cp: overwrite ‘/etc/localtime’?`时输入`y`回车。然后再使用`date -R`看下时间是否矫正过来了。

#### 2. 下载官方安装脚本

```shell
bash <(curl -L -s https://install.direct/go.sh)
```

注意，该网址可能已经失效，但会提供一个新的网址

这个脚本会自动安装zip等依赖软件，安装结束后可以卸载这些

### 3. 配置文件

第2步安装会显示配置文件在哪里，不一定在etc，也可能在usr

找到配置文件，写入：

```javascript
{
  "log" : {
    "access": "/var/log/v2ray/access.log",
    "error": "/var/log/v2ray/error.log",
    "loglevel": "warning"
  },
  "inbound": {
    "port": 2024, //这里写你的服务器端口（需要防火墙放行）
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", //这里是uuid 需要和客户端一致
          "level": 1,
          "alterId": 64
        }
      ]
    }
  },
  "outbound": {
    "protocol": "freedom",
    "settings": {}
  },
  "outboundDetour": [
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",
          "ip": ["geoip:private"],
          "outboundTag": "blocked"
        }
      ]
    }
  }
}
```

注意这里的用户id是自行写入的，好比账号密码，要获取UUID可以去这个 [UUID Generator ](https://www.uuidgenerator.net/)网站，每次刷新网页会随机生成一个UUID；

端口号自己填写

然后`streamSettings`可以不用，默认使用tcp，这里则改成了kcp，kcp使用的udp，对于延迟丢包率较高的网络可以改善，但安全性还不能确定

alter ID 也要保持一致

#### 4. 客户端配置

```javascript
{
    "log": {
        "loglevel": "warning"
    },
    "inbound": {
        "listen": "127.0.0.1",
        "port": 1080,
        "protocol": "socks",
        "settings": {
            "auth": "noauth",
            "udp": true,
            "ip": "127.0.0.1"
        }
    },
    "outbound": {
        "protocol": "vmess",
        "settings": {
            "vnext": [
                {
                    "address": "your IP address",
                    "port": 2024,
                    "users": [
                        {
                            "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                            "level": 1,
                            "alterId": 100
                        }
                    ]
                }
            ]
        }
     }
}

```

注意这里没有写`streamSettings`，但是如果服务器加入了，这里也要加入

#### 5. 开启ipv6

如果服务器有ipv6，可能只需要把address改成ipv6即可。还不确定

### 6. 开启bbr

BBR是来自于Google的黑科技，目的是通过优化和控制TCP的拥塞，充分利用带宽并降低延迟，起到神奇般的加速效果。

BBR 这个特性其实是在 Linux 内核 4.9 才计划加入的。所以，要开启BBR，需要内核版本在Linux kernel 4.9以上。下面纪录一下如何升级Linux内核，并且开启BBR：

因为低版本的ubuntu和centos(7)内核版本不够，所以要下载新内核。

结果：**加速明显**

参考：https://xiaozhou.net/enable-bbr-for-vps-2017-06-10.html

https://blog.51cto.com/bella41981/2501890





参考：https://twoha.blogspot.com/2019/07/centos-7-v2ray.html
