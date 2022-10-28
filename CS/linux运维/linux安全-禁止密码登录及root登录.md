---
title: linux安全-禁止密码登录及root登录
date: 2021-07-27 10:03:51
categories:
- Linux
---
使用root配置/etc/ssh/sshd_config文件：

PasswordAuthentication no # 禁用密码登录

PermitRootLogin no # 禁止root用户登录，如果你想让root用户只能远程密钥登录，此处可配置为without-password

当然，如果要做更多的用户安全策略，还有许多工作可做。例如sudo权限精确化（严格控制），增加用户操作审计日志等，如果有堡垒机那就更好了。