---
title: v2ray链接ipv6
date: 2021-07-27 10:03:51
categories:
- Linux
---
两种方法

### v2ray直接配置ipv6

应该是参考这里：https://www.codenong.com/js93d3ce4ead4a/

不确定，因为我的同时支持ipv4和ipv6

（或者是天生支持两种？？）

### 出口优先用ipv4

默认用的ipv6

```json
{
  "inbounds": [
    // your inbouds config
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "domain": [
          "domain:google.com"
        ],
        "outboundTag": "ipv4"
      }
    ]
  },
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "tag": "ipv4",
      "sendThrough": "your ip",
      "protocol": "freedom",
      "settings": {}
    }
  ]
}
```

参考：https://github.com/v2ray/v2ray-core/issues/308

### 后台转发ipv6数据到ipv4

https://v2raytech.com/add-ipv6-support/



注意因为之前已经用了第一种方法，所以使用第二种方法时要换一个端口。